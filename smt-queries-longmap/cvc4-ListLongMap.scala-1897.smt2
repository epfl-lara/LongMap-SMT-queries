; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33876 () Bool)

(assert start!33876)

(declare-fun b_free!7055 () Bool)

(declare-fun b_next!7055 () Bool)

(assert (=> start!33876 (= b_free!7055 (not b_next!7055))))

(declare-fun tp!24677 () Bool)

(declare-fun b_and!14241 () Bool)

(assert (=> start!33876 (= tp!24677 b_and!14241)))

(declare-fun b!337227 () Bool)

(declare-fun res!186241 () Bool)

(declare-fun e!206948 () Bool)

(assert (=> b!337227 (=> (not res!186241) (not e!206948))))

(declare-datatypes ((array!17609 0))(
  ( (array!17610 (arr!8332 (Array (_ BitVec 32) (_ BitVec 64))) (size!8684 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17609)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17609 (_ BitVec 32)) Bool)

(assert (=> b!337227 (= res!186241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337228 () Bool)

(declare-fun res!186245 () Bool)

(assert (=> b!337228 (=> (not res!186245) (not e!206948))))

(declare-datatypes ((V!10319 0))(
  ( (V!10320 (val!3548 Int)) )
))
(declare-datatypes ((ValueCell!3160 0))(
  ( (ValueCellFull!3160 (v!5713 V!10319)) (EmptyCell!3160) )
))
(declare-datatypes ((array!17611 0))(
  ( (array!17612 (arr!8333 (Array (_ BitVec 32) ValueCell!3160)) (size!8685 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17611)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337228 (= res!186245 (and (= (size!8685 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8684 _keys!1895) (size!8685 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337229 () Bool)

(declare-fun e!206952 () Bool)

(declare-fun tp_is_empty!7007 () Bool)

(assert (=> b!337229 (= e!206952 tp_is_empty!7007)))

(declare-fun b!337231 () Bool)

(declare-fun res!186244 () Bool)

(assert (=> b!337231 (=> (not res!186244) (not e!206948))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337231 (= res!186244 (validKeyInArray!0 k!1348))))

(declare-fun b!337232 () Bool)

(declare-fun res!186242 () Bool)

(declare-fun e!206950 () Bool)

(assert (=> b!337232 (=> (not res!186242) (not e!206950))))

(declare-fun arrayContainsKey!0 (array!17609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337232 (= res!186242 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337233 () Bool)

(assert (=> b!337233 (= e!206948 e!206950)))

(declare-fun res!186243 () Bool)

(assert (=> b!337233 (=> (not res!186243) (not e!206950))))

(declare-datatypes ((SeekEntryResult!3220 0))(
  ( (MissingZero!3220 (index!15059 (_ BitVec 32))) (Found!3220 (index!15060 (_ BitVec 32))) (Intermediate!3220 (undefined!4032 Bool) (index!15061 (_ BitVec 32)) (x!33608 (_ BitVec 32))) (Undefined!3220) (MissingVacant!3220 (index!15062 (_ BitVec 32))) )
))
(declare-fun lt!160395 () SeekEntryResult!3220)

(assert (=> b!337233 (= res!186243 (and (not (is-Found!3220 lt!160395)) (is-MissingZero!3220 lt!160395)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17609 (_ BitVec 32)) SeekEntryResult!3220)

(assert (=> b!337233 (= lt!160395 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!337234 () Bool)

(assert (=> b!337234 (= e!206950 false)))

(declare-fun lt!160396 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17609 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337234 (= lt!160396 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11916 () Bool)

(declare-fun mapRes!11916 () Bool)

(declare-fun tp!24678 () Bool)

(assert (=> mapNonEmpty!11916 (= mapRes!11916 (and tp!24678 e!206952))))

(declare-fun mapKey!11916 () (_ BitVec 32))

(declare-fun mapValue!11916 () ValueCell!3160)

(declare-fun mapRest!11916 () (Array (_ BitVec 32) ValueCell!3160))

(assert (=> mapNonEmpty!11916 (= (arr!8333 _values!1525) (store mapRest!11916 mapKey!11916 mapValue!11916))))

(declare-fun b!337230 () Bool)

(declare-fun res!186247 () Bool)

(assert (=> b!337230 (=> (not res!186247) (not e!206948))))

(declare-fun zeroValue!1467 () V!10319)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10319)

(declare-datatypes ((tuple2!5154 0))(
  ( (tuple2!5155 (_1!2588 (_ BitVec 64)) (_2!2588 V!10319)) )
))
(declare-datatypes ((List!4769 0))(
  ( (Nil!4766) (Cons!4765 (h!5621 tuple2!5154) (t!9863 List!4769)) )
))
(declare-datatypes ((ListLongMap!4067 0))(
  ( (ListLongMap!4068 (toList!2049 List!4769)) )
))
(declare-fun contains!2096 (ListLongMap!4067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1570 (array!17609 array!17611 (_ BitVec 32) (_ BitVec 32) V!10319 V!10319 (_ BitVec 32) Int) ListLongMap!4067)

(assert (=> b!337230 (= res!186247 (not (contains!2096 (getCurrentListMap!1570 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!186246 () Bool)

(assert (=> start!33876 (=> (not res!186246) (not e!206948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33876 (= res!186246 (validMask!0 mask!2385))))

(assert (=> start!33876 e!206948))

(assert (=> start!33876 true))

(assert (=> start!33876 tp_is_empty!7007))

(assert (=> start!33876 tp!24677))

(declare-fun e!206949 () Bool)

(declare-fun array_inv!6186 (array!17611) Bool)

(assert (=> start!33876 (and (array_inv!6186 _values!1525) e!206949)))

(declare-fun array_inv!6187 (array!17609) Bool)

(assert (=> start!33876 (array_inv!6187 _keys!1895)))

(declare-fun b!337235 () Bool)

(declare-fun res!186248 () Bool)

(assert (=> b!337235 (=> (not res!186248) (not e!206948))))

(declare-datatypes ((List!4770 0))(
  ( (Nil!4767) (Cons!4766 (h!5622 (_ BitVec 64)) (t!9864 List!4770)) )
))
(declare-fun arrayNoDuplicates!0 (array!17609 (_ BitVec 32) List!4770) Bool)

(assert (=> b!337235 (= res!186248 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4767))))

(declare-fun b!337236 () Bool)

(declare-fun e!206947 () Bool)

(assert (=> b!337236 (= e!206947 tp_is_empty!7007)))

(declare-fun mapIsEmpty!11916 () Bool)

(assert (=> mapIsEmpty!11916 mapRes!11916))

(declare-fun b!337237 () Bool)

(assert (=> b!337237 (= e!206949 (and e!206947 mapRes!11916))))

(declare-fun condMapEmpty!11916 () Bool)

(declare-fun mapDefault!11916 () ValueCell!3160)

