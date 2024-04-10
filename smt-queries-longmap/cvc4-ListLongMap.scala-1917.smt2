; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34114 () Bool)

(assert start!34114)

(declare-fun b_free!7175 () Bool)

(declare-fun b_next!7175 () Bool)

(assert (=> start!34114 (= b_free!7175 (not b_next!7175))))

(declare-fun tp!25053 () Bool)

(declare-fun b_and!14371 () Bool)

(assert (=> start!34114 (= tp!25053 b_and!14371)))

(declare-fun mapIsEmpty!12111 () Bool)

(declare-fun mapRes!12111 () Bool)

(assert (=> mapIsEmpty!12111 mapRes!12111))

(declare-fun b!339991 () Bool)

(declare-fun e!208579 () Bool)

(declare-fun tp_is_empty!7127 () Bool)

(assert (=> b!339991 (= e!208579 tp_is_empty!7127)))

(declare-fun res!187800 () Bool)

(declare-fun e!208580 () Bool)

(assert (=> start!34114 (=> (not res!187800) (not e!208580))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34114 (= res!187800 (validMask!0 mask!2385))))

(assert (=> start!34114 e!208580))

(assert (=> start!34114 true))

(assert (=> start!34114 tp_is_empty!7127))

(assert (=> start!34114 tp!25053))

(declare-datatypes ((V!10479 0))(
  ( (V!10480 (val!3608 Int)) )
))
(declare-datatypes ((ValueCell!3220 0))(
  ( (ValueCellFull!3220 (v!5778 V!10479)) (EmptyCell!3220) )
))
(declare-datatypes ((array!17855 0))(
  ( (array!17856 (arr!8450 (Array (_ BitVec 32) ValueCell!3220)) (size!8802 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17855)

(declare-fun e!208577 () Bool)

(declare-fun array_inv!6262 (array!17855) Bool)

(assert (=> start!34114 (and (array_inv!6262 _values!1525) e!208577)))

(declare-datatypes ((array!17857 0))(
  ( (array!17858 (arr!8451 (Array (_ BitVec 32) (_ BitVec 64))) (size!8803 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17857)

(declare-fun array_inv!6263 (array!17857) Bool)

(assert (=> start!34114 (array_inv!6263 _keys!1895)))

(declare-fun b!339992 () Bool)

(declare-fun res!187799 () Bool)

(assert (=> b!339992 (=> (not res!187799) (not e!208580))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339992 (= res!187799 (and (= (size!8802 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8803 _keys!1895) (size!8802 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339993 () Bool)

(declare-fun res!187797 () Bool)

(assert (=> b!339993 (=> (not res!187797) (not e!208580))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339993 (= res!187797 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!12111 () Bool)

(declare-fun tp!25052 () Bool)

(declare-fun e!208581 () Bool)

(assert (=> mapNonEmpty!12111 (= mapRes!12111 (and tp!25052 e!208581))))

(declare-fun mapKey!12111 () (_ BitVec 32))

(declare-fun mapRest!12111 () (Array (_ BitVec 32) ValueCell!3220))

(declare-fun mapValue!12111 () ValueCell!3220)

(assert (=> mapNonEmpty!12111 (= (arr!8450 _values!1525) (store mapRest!12111 mapKey!12111 mapValue!12111))))

(declare-fun b!339994 () Bool)

(declare-datatypes ((SeekEntryResult!3265 0))(
  ( (MissingZero!3265 (index!15239 (_ BitVec 32))) (Found!3265 (index!15240 (_ BitVec 32))) (Intermediate!3265 (undefined!4077 Bool) (index!15241 (_ BitVec 32)) (x!33863 (_ BitVec 32))) (Undefined!3265) (MissingVacant!3265 (index!15242 (_ BitVec 32))) )
))
(declare-fun lt!161377 () SeekEntryResult!3265)

(assert (=> b!339994 (= e!208580 (and (not (is-Found!3265 lt!161377)) (not (is-MissingZero!3265 lt!161377)) (is-MissingVacant!3265 lt!161377) (bvslt #b00000000000000000000000000000000 (size!8803 _keys!1895)) (bvsge (size!8803 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17857 (_ BitVec 32)) SeekEntryResult!3265)

(assert (=> b!339994 (= lt!161377 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339995 () Bool)

(assert (=> b!339995 (= e!208581 tp_is_empty!7127)))

(declare-fun b!339996 () Bool)

(declare-fun res!187802 () Bool)

(assert (=> b!339996 (=> (not res!187802) (not e!208580))))

(declare-fun zeroValue!1467 () V!10479)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10479)

(declare-datatypes ((tuple2!5238 0))(
  ( (tuple2!5239 (_1!2630 (_ BitVec 64)) (_2!2630 V!10479)) )
))
(declare-datatypes ((List!4857 0))(
  ( (Nil!4854) (Cons!4853 (h!5709 tuple2!5238) (t!9961 List!4857)) )
))
(declare-datatypes ((ListLongMap!4151 0))(
  ( (ListLongMap!4152 (toList!2091 List!4857)) )
))
(declare-fun contains!2143 (ListLongMap!4151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1612 (array!17857 array!17855 (_ BitVec 32) (_ BitVec 32) V!10479 V!10479 (_ BitVec 32) Int) ListLongMap!4151)

(assert (=> b!339996 (= res!187802 (not (contains!2143 (getCurrentListMap!1612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!339997 () Bool)

(declare-fun res!187798 () Bool)

(assert (=> b!339997 (=> (not res!187798) (not e!208580))))

(declare-datatypes ((List!4858 0))(
  ( (Nil!4855) (Cons!4854 (h!5710 (_ BitVec 64)) (t!9962 List!4858)) )
))
(declare-fun arrayNoDuplicates!0 (array!17857 (_ BitVec 32) List!4858) Bool)

(assert (=> b!339997 (= res!187798 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4855))))

(declare-fun b!339998 () Bool)

(assert (=> b!339998 (= e!208577 (and e!208579 mapRes!12111))))

(declare-fun condMapEmpty!12111 () Bool)

(declare-fun mapDefault!12111 () ValueCell!3220)

