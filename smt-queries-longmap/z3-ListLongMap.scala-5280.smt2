; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70830 () Bool)

(assert start!70830)

(declare-fun b_free!13087 () Bool)

(declare-fun b_next!13087 () Bool)

(assert (=> start!70830 (= b_free!13087 (not b_next!13087))))

(declare-fun tp!46008 () Bool)

(declare-fun b_and!21945 () Bool)

(assert (=> start!70830 (= tp!46008 b_and!21945)))

(declare-fun b!822653 () Bool)

(declare-fun e!457433 () Bool)

(declare-fun tp_is_empty!14797 () Bool)

(assert (=> b!822653 (= e!457433 tp_is_empty!14797)))

(declare-fun b!822654 () Bool)

(declare-fun e!457434 () Bool)

(declare-fun e!457436 () Bool)

(declare-fun mapRes!23809 () Bool)

(assert (=> b!822654 (= e!457434 (and e!457436 mapRes!23809))))

(declare-fun condMapEmpty!23809 () Bool)

(declare-datatypes ((V!24731 0))(
  ( (V!24732 (val!7446 Int)) )
))
(declare-datatypes ((ValueCell!6983 0))(
  ( (ValueCellFull!6983 (v!9872 V!24731)) (EmptyCell!6983) )
))
(declare-datatypes ((array!45757 0))(
  ( (array!45758 (arr!21928 (Array (_ BitVec 32) ValueCell!6983)) (size!22349 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45757)

(declare-fun mapDefault!23809 () ValueCell!6983)

(assert (=> b!822654 (= condMapEmpty!23809 (= (arr!21928 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6983)) mapDefault!23809)))))

(declare-fun b!822655 () Bool)

(declare-fun res!561098 () Bool)

(declare-fun e!457432 () Bool)

(assert (=> b!822655 (=> (not res!561098) (not e!457432))))

(declare-datatypes ((array!45759 0))(
  ( (array!45760 (arr!21929 (Array (_ BitVec 32) (_ BitVec 64))) (size!22350 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45759)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45759 (_ BitVec 32)) Bool)

(assert (=> b!822655 (= res!561098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822656 () Bool)

(declare-fun e!457435 () Bool)

(assert (=> b!822656 (= e!457432 (not e!457435))))

(declare-fun res!561099 () Bool)

(assert (=> b!822656 (=> res!561099 e!457435)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822656 (= res!561099 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9840 0))(
  ( (tuple2!9841 (_1!4931 (_ BitVec 64)) (_2!4931 V!24731)) )
))
(declare-datatypes ((List!15652 0))(
  ( (Nil!15649) (Cons!15648 (h!16777 tuple2!9840) (t!21982 List!15652)) )
))
(declare-datatypes ((ListLongMap!8653 0))(
  ( (ListLongMap!8654 (toList!4342 List!15652)) )
))
(declare-fun lt!370370 () ListLongMap!8653)

(declare-fun lt!370376 () ListLongMap!8653)

(assert (=> b!822656 (= lt!370370 lt!370376)))

(declare-fun zeroValueBefore!34 () V!24731)

(declare-fun zeroValueAfter!34 () V!24731)

(declare-fun minValue!754 () V!24731)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28106 0))(
  ( (Unit!28107) )
))
(declare-fun lt!370379 () Unit!28106)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!481 (array!45759 array!45757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 V!24731 V!24731 (_ BitVec 32) Int) Unit!28106)

(assert (=> b!822656 (= lt!370379 (lemmaNoChangeToArrayThenSameMapNoExtras!481 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2388 (array!45759 array!45757 (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 (_ BitVec 32) Int) ListLongMap!8653)

(assert (=> b!822656 (= lt!370376 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822656 (= lt!370370 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822657 () Bool)

(declare-fun res!561101 () Bool)

(assert (=> b!822657 (=> (not res!561101) (not e!457432))))

(assert (=> b!822657 (= res!561101 (and (= (size!22349 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22350 _keys!976) (size!22349 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822658 () Bool)

(assert (=> b!822658 (= e!457435 true)))

(declare-fun lt!370373 () ListLongMap!8653)

(declare-fun lt!370372 () ListLongMap!8653)

(declare-fun lt!370375 () tuple2!9840)

(declare-fun +!1920 (ListLongMap!8653 tuple2!9840) ListLongMap!8653)

(assert (=> b!822658 (= lt!370373 (+!1920 lt!370372 lt!370375))))

(declare-fun lt!370377 () Unit!28106)

(declare-fun addCommutativeForDiffKeys!451 (ListLongMap!8653 (_ BitVec 64) V!24731 (_ BitVec 64) V!24731) Unit!28106)

(assert (=> b!822658 (= lt!370377 (addCommutativeForDiffKeys!451 lt!370370 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370374 () ListLongMap!8653)

(assert (=> b!822658 (= lt!370374 lt!370373)))

(declare-fun lt!370378 () tuple2!9840)

(assert (=> b!822658 (= lt!370373 (+!1920 (+!1920 lt!370370 lt!370375) lt!370378))))

(assert (=> b!822658 (= lt!370375 (tuple2!9841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370371 () ListLongMap!8653)

(assert (=> b!822658 (= lt!370371 lt!370372)))

(assert (=> b!822658 (= lt!370372 (+!1920 lt!370370 lt!370378))))

(assert (=> b!822658 (= lt!370378 (tuple2!9841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2462 (array!45759 array!45757 (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 (_ BitVec 32) Int) ListLongMap!8653)

(assert (=> b!822658 (= lt!370374 (getCurrentListMap!2462 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822658 (= lt!370371 (getCurrentListMap!2462 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23809 () Bool)

(assert (=> mapIsEmpty!23809 mapRes!23809))

(declare-fun b!822659 () Bool)

(assert (=> b!822659 (= e!457436 tp_is_empty!14797)))

(declare-fun b!822660 () Bool)

(declare-fun res!561102 () Bool)

(assert (=> b!822660 (=> (not res!561102) (not e!457432))))

(declare-datatypes ((List!15653 0))(
  ( (Nil!15650) (Cons!15649 (h!16778 (_ BitVec 64)) (t!21983 List!15653)) )
))
(declare-fun arrayNoDuplicates!0 (array!45759 (_ BitVec 32) List!15653) Bool)

(assert (=> b!822660 (= res!561102 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15650))))

(declare-fun res!561100 () Bool)

(assert (=> start!70830 (=> (not res!561100) (not e!457432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70830 (= res!561100 (validMask!0 mask!1312))))

(assert (=> start!70830 e!457432))

(assert (=> start!70830 tp_is_empty!14797))

(declare-fun array_inv!17575 (array!45759) Bool)

(assert (=> start!70830 (array_inv!17575 _keys!976)))

(assert (=> start!70830 true))

(declare-fun array_inv!17576 (array!45757) Bool)

(assert (=> start!70830 (and (array_inv!17576 _values!788) e!457434)))

(assert (=> start!70830 tp!46008))

(declare-fun mapNonEmpty!23809 () Bool)

(declare-fun tp!46009 () Bool)

(assert (=> mapNonEmpty!23809 (= mapRes!23809 (and tp!46009 e!457433))))

(declare-fun mapRest!23809 () (Array (_ BitVec 32) ValueCell!6983))

(declare-fun mapKey!23809 () (_ BitVec 32))

(declare-fun mapValue!23809 () ValueCell!6983)

(assert (=> mapNonEmpty!23809 (= (arr!21928 _values!788) (store mapRest!23809 mapKey!23809 mapValue!23809))))

(assert (= (and start!70830 res!561100) b!822657))

(assert (= (and b!822657 res!561101) b!822655))

(assert (= (and b!822655 res!561098) b!822660))

(assert (= (and b!822660 res!561102) b!822656))

(assert (= (and b!822656 (not res!561099)) b!822658))

(assert (= (and b!822654 condMapEmpty!23809) mapIsEmpty!23809))

(assert (= (and b!822654 (not condMapEmpty!23809)) mapNonEmpty!23809))

(get-info :version)

(assert (= (and mapNonEmpty!23809 ((_ is ValueCellFull!6983) mapValue!23809)) b!822653))

(assert (= (and b!822654 ((_ is ValueCellFull!6983) mapDefault!23809)) b!822659))

(assert (= start!70830 b!822654))

(declare-fun m!764129 () Bool)

(assert (=> b!822660 m!764129))

(declare-fun m!764131 () Bool)

(assert (=> start!70830 m!764131))

(declare-fun m!764133 () Bool)

(assert (=> start!70830 m!764133))

(declare-fun m!764135 () Bool)

(assert (=> start!70830 m!764135))

(declare-fun m!764137 () Bool)

(assert (=> mapNonEmpty!23809 m!764137))

(declare-fun m!764139 () Bool)

(assert (=> b!822655 m!764139))

(declare-fun m!764141 () Bool)

(assert (=> b!822658 m!764141))

(declare-fun m!764143 () Bool)

(assert (=> b!822658 m!764143))

(declare-fun m!764145 () Bool)

(assert (=> b!822658 m!764145))

(declare-fun m!764147 () Bool)

(assert (=> b!822658 m!764147))

(assert (=> b!822658 m!764143))

(declare-fun m!764149 () Bool)

(assert (=> b!822658 m!764149))

(declare-fun m!764151 () Bool)

(assert (=> b!822658 m!764151))

(declare-fun m!764153 () Bool)

(assert (=> b!822658 m!764153))

(declare-fun m!764155 () Bool)

(assert (=> b!822656 m!764155))

(declare-fun m!764157 () Bool)

(assert (=> b!822656 m!764157))

(declare-fun m!764159 () Bool)

(assert (=> b!822656 m!764159))

(check-sat (not b!822655) b_and!21945 (not b!822656) tp_is_empty!14797 (not mapNonEmpty!23809) (not start!70830) (not b_next!13087) (not b!822660) (not b!822658))
(check-sat b_and!21945 (not b_next!13087))
