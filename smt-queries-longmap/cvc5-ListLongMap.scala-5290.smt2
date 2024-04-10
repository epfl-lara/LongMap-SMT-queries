; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70930 () Bool)

(assert start!70930)

(declare-fun b_free!13147 () Bool)

(declare-fun b_next!13147 () Bool)

(assert (=> start!70930 (= b_free!13147 (not b_next!13147))))

(declare-fun tp!46191 () Bool)

(declare-fun b_and!22043 () Bool)

(assert (=> start!70930 (= tp!46191 b_and!22043)))

(declare-fun b!823780 () Bool)

(declare-fun res!561714 () Bool)

(declare-fun e!458218 () Bool)

(assert (=> b!823780 (=> (not res!561714) (not e!458218))))

(declare-datatypes ((array!45904 0))(
  ( (array!45905 (arr!22000 (Array (_ BitVec 32) (_ BitVec 64))) (size!22421 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45904)

(declare-datatypes ((List!15698 0))(
  ( (Nil!15695) (Cons!15694 (h!16823 (_ BitVec 64)) (t!22039 List!15698)) )
))
(declare-fun arrayNoDuplicates!0 (array!45904 (_ BitVec 32) List!15698) Bool)

(assert (=> b!823780 (= res!561714 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15695))))

(declare-fun b!823781 () Bool)

(assert (=> b!823781 (= e!458218 (not true))))

(declare-datatypes ((V!24811 0))(
  ( (V!24812 (val!7476 Int)) )
))
(declare-datatypes ((tuple2!9886 0))(
  ( (tuple2!9887 (_1!4954 (_ BitVec 64)) (_2!4954 V!24811)) )
))
(declare-datatypes ((List!15699 0))(
  ( (Nil!15696) (Cons!15695 (h!16824 tuple2!9886) (t!22040 List!15699)) )
))
(declare-datatypes ((ListLongMap!8709 0))(
  ( (ListLongMap!8710 (toList!4370 List!15699)) )
))
(declare-fun lt!371529 () ListLongMap!8709)

(declare-fun lt!371530 () ListLongMap!8709)

(assert (=> b!823781 (= lt!371529 lt!371530)))

(declare-fun zeroValueBefore!34 () V!24811)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24811)

(declare-fun minValue!754 () V!24811)

(declare-datatypes ((ValueCell!7013 0))(
  ( (ValueCellFull!7013 (v!9909 V!24811)) (EmptyCell!7013) )
))
(declare-datatypes ((array!45906 0))(
  ( (array!45907 (arr!22001 (Array (_ BitVec 32) ValueCell!7013)) (size!22422 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45906)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28208 0))(
  ( (Unit!28209) )
))
(declare-fun lt!371528 () Unit!28208)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!495 (array!45904 array!45906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24811 V!24811 V!24811 V!24811 (_ BitVec 32) Int) Unit!28208)

(assert (=> b!823781 (= lt!371528 (lemmaNoChangeToArrayThenSameMapNoExtras!495 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2385 (array!45904 array!45906 (_ BitVec 32) (_ BitVec 32) V!24811 V!24811 (_ BitVec 32) Int) ListLongMap!8709)

(assert (=> b!823781 (= lt!371530 (getCurrentListMapNoExtraKeys!2385 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823781 (= lt!371529 (getCurrentListMapNoExtraKeys!2385 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823783 () Bool)

(declare-fun res!561715 () Bool)

(assert (=> b!823783 (=> (not res!561715) (not e!458218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45904 (_ BitVec 32)) Bool)

(assert (=> b!823783 (= res!561715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823784 () Bool)

(declare-fun e!458216 () Bool)

(declare-fun tp_is_empty!14857 () Bool)

(assert (=> b!823784 (= e!458216 tp_is_empty!14857)))

(declare-fun b!823785 () Bool)

(declare-fun e!458214 () Bool)

(assert (=> b!823785 (= e!458214 tp_is_empty!14857)))

(declare-fun mapNonEmpty!23902 () Bool)

(declare-fun mapRes!23902 () Bool)

(declare-fun tp!46192 () Bool)

(assert (=> mapNonEmpty!23902 (= mapRes!23902 (and tp!46192 e!458216))))

(declare-fun mapRest!23902 () (Array (_ BitVec 32) ValueCell!7013))

(declare-fun mapKey!23902 () (_ BitVec 32))

(declare-fun mapValue!23902 () ValueCell!7013)

(assert (=> mapNonEmpty!23902 (= (arr!22001 _values!788) (store mapRest!23902 mapKey!23902 mapValue!23902))))

(declare-fun b!823786 () Bool)

(declare-fun res!561713 () Bool)

(assert (=> b!823786 (=> (not res!561713) (not e!458218))))

(assert (=> b!823786 (= res!561713 (and (= (size!22422 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22421 _keys!976) (size!22422 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23902 () Bool)

(assert (=> mapIsEmpty!23902 mapRes!23902))

(declare-fun res!561716 () Bool)

(assert (=> start!70930 (=> (not res!561716) (not e!458218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70930 (= res!561716 (validMask!0 mask!1312))))

(assert (=> start!70930 e!458218))

(assert (=> start!70930 tp_is_empty!14857))

(declare-fun array_inv!17559 (array!45904) Bool)

(assert (=> start!70930 (array_inv!17559 _keys!976)))

(assert (=> start!70930 true))

(declare-fun e!458215 () Bool)

(declare-fun array_inv!17560 (array!45906) Bool)

(assert (=> start!70930 (and (array_inv!17560 _values!788) e!458215)))

(assert (=> start!70930 tp!46191))

(declare-fun b!823782 () Bool)

(assert (=> b!823782 (= e!458215 (and e!458214 mapRes!23902))))

(declare-fun condMapEmpty!23902 () Bool)

(declare-fun mapDefault!23902 () ValueCell!7013)

