; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33760 () Bool)

(assert start!33760)

(declare-fun b_free!6995 () Bool)

(declare-fun b_next!6995 () Bool)

(assert (=> start!33760 (= b_free!6995 (not b_next!6995))))

(declare-fun tp!24488 () Bool)

(declare-fun b_and!14175 () Bool)

(assert (=> start!33760 (= tp!24488 b_and!14175)))

(declare-fun mapIsEmpty!11817 () Bool)

(declare-fun mapRes!11817 () Bool)

(assert (=> mapIsEmpty!11817 mapRes!11817))

(declare-fun mapNonEmpty!11817 () Bool)

(declare-fun tp!24489 () Bool)

(declare-fun e!206181 () Bool)

(assert (=> mapNonEmpty!11817 (= mapRes!11817 (and tp!24489 e!206181))))

(declare-fun mapKey!11817 () (_ BitVec 32))

(declare-datatypes ((V!10239 0))(
  ( (V!10240 (val!3518 Int)) )
))
(declare-datatypes ((ValueCell!3130 0))(
  ( (ValueCellFull!3130 (v!5680 V!10239)) (EmptyCell!3130) )
))
(declare-fun mapValue!11817 () ValueCell!3130)

(declare-fun mapRest!11817 () (Array (_ BitVec 32) ValueCell!3130))

(declare-datatypes ((array!17487 0))(
  ( (array!17488 (arr!8274 (Array (_ BitVec 32) ValueCell!3130)) (size!8626 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17487)

(assert (=> mapNonEmpty!11817 (= (arr!8274 _values!1525) (store mapRest!11817 mapKey!11817 mapValue!11817))))

(declare-fun b!335888 () Bool)

(declare-fun res!185423 () Bool)

(declare-fun e!206179 () Bool)

(assert (=> b!335888 (=> (not res!185423) (not e!206179))))

(declare-datatypes ((array!17489 0))(
  ( (array!17490 (arr!8275 (Array (_ BitVec 32) (_ BitVec 64))) (size!8627 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17489)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun mask!2385 () (_ BitVec 32))

(assert (=> b!335888 (= res!185423 (and (= (size!8626 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8627 _keys!1895) (size!8626 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335889 () Bool)

(declare-fun res!185421 () Bool)

(assert (=> b!335889 (=> (not res!185421) (not e!206179))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335889 (= res!185421 (validKeyInArray!0 k!1348))))

(declare-fun b!335890 () Bool)

(declare-datatypes ((SeekEntryResult!3199 0))(
  ( (MissingZero!3199 (index!14975 (_ BitVec 32))) (Found!3199 (index!14976 (_ BitVec 32))) (Intermediate!3199 (undefined!4011 Bool) (index!14977 (_ BitVec 32)) (x!33477 (_ BitVec 32))) (Undefined!3199) (MissingVacant!3199 (index!14978 (_ BitVec 32))) )
))
(declare-fun lt!159955 () SeekEntryResult!3199)

(assert (=> b!335890 (= e!206179 (and (not (is-Found!3199 lt!159955)) (is-MissingZero!3199 lt!159955) (bvsge #b00000000000000000000000000000000 (size!8627 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17489 (_ BitVec 32)) SeekEntryResult!3199)

(assert (=> b!335890 (= lt!159955 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335891 () Bool)

(declare-fun res!185420 () Bool)

(assert (=> b!335891 (=> (not res!185420) (not e!206179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17489 (_ BitVec 32)) Bool)

(assert (=> b!335891 (= res!185420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335892 () Bool)

(declare-fun tp_is_empty!6947 () Bool)

(assert (=> b!335892 (= e!206181 tp_is_empty!6947)))

(declare-fun res!185422 () Bool)

(assert (=> start!33760 (=> (not res!185422) (not e!206179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33760 (= res!185422 (validMask!0 mask!2385))))

(assert (=> start!33760 e!206179))

(assert (=> start!33760 true))

(assert (=> start!33760 tp_is_empty!6947))

(assert (=> start!33760 tp!24488))

(declare-fun e!206180 () Bool)

(declare-fun array_inv!6144 (array!17487) Bool)

(assert (=> start!33760 (and (array_inv!6144 _values!1525) e!206180)))

(declare-fun array_inv!6145 (array!17489) Bool)

(assert (=> start!33760 (array_inv!6145 _keys!1895)))

(declare-fun b!335893 () Bool)

(declare-fun res!185419 () Bool)

(assert (=> b!335893 (=> (not res!185419) (not e!206179))))

(declare-datatypes ((List!4729 0))(
  ( (Nil!4726) (Cons!4725 (h!5581 (_ BitVec 64)) (t!9817 List!4729)) )
))
(declare-fun arrayNoDuplicates!0 (array!17489 (_ BitVec 32) List!4729) Bool)

(assert (=> b!335893 (= res!185419 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4726))))

(declare-fun b!335894 () Bool)

(declare-fun e!206178 () Bool)

(assert (=> b!335894 (= e!206178 tp_is_empty!6947)))

(declare-fun b!335895 () Bool)

(declare-fun res!185418 () Bool)

(assert (=> b!335895 (=> (not res!185418) (not e!206179))))

(declare-fun zeroValue!1467 () V!10239)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10239)

(declare-datatypes ((tuple2!5112 0))(
  ( (tuple2!5113 (_1!2567 (_ BitVec 64)) (_2!2567 V!10239)) )
))
(declare-datatypes ((List!4730 0))(
  ( (Nil!4727) (Cons!4726 (h!5582 tuple2!5112) (t!9818 List!4730)) )
))
(declare-datatypes ((ListLongMap!4025 0))(
  ( (ListLongMap!4026 (toList!2028 List!4730)) )
))
(declare-fun contains!2072 (ListLongMap!4025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1549 (array!17489 array!17487 (_ BitVec 32) (_ BitVec 32) V!10239 V!10239 (_ BitVec 32) Int) ListLongMap!4025)

(assert (=> b!335895 (= res!185418 (not (contains!2072 (getCurrentListMap!1549 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!335896 () Bool)

(assert (=> b!335896 (= e!206180 (and e!206178 mapRes!11817))))

(declare-fun condMapEmpty!11817 () Bool)

(declare-fun mapDefault!11817 () ValueCell!3130)

