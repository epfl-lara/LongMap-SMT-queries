; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69954 () Bool)

(assert start!69954)

(declare-fun b_free!12387 () Bool)

(declare-fun b_next!12387 () Bool)

(assert (=> start!69954 (= b_free!12387 (not b_next!12387))))

(declare-fun tp!43872 () Bool)

(declare-fun b_and!21155 () Bool)

(assert (=> start!69954 (= tp!43872 b_and!21155)))

(declare-fun b!813145 () Bool)

(declare-fun e!450539 () Bool)

(assert (=> b!813145 (= e!450539 false)))

(declare-datatypes ((V!23797 0))(
  ( (V!23798 (val!7096 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23797)

(declare-datatypes ((array!44406 0))(
  ( (array!44407 (arr!21264 (Array (_ BitVec 32) (_ BitVec 64))) (size!21685 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44406)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((tuple2!9292 0))(
  ( (tuple2!9293 (_1!4657 (_ BitVec 64)) (_2!4657 V!23797)) )
))
(declare-datatypes ((List!15124 0))(
  ( (Nil!15121) (Cons!15120 (h!16249 tuple2!9292) (t!21439 List!15124)) )
))
(declare-datatypes ((ListLongMap!8115 0))(
  ( (ListLongMap!8116 (toList!4073 List!15124)) )
))
(declare-fun lt!364242 () ListLongMap!8115)

(declare-fun minValue!754 () V!23797)

(declare-datatypes ((ValueCell!6633 0))(
  ( (ValueCellFull!6633 (v!9523 V!23797)) (EmptyCell!6633) )
))
(declare-datatypes ((array!44408 0))(
  ( (array!44409 (arr!21265 (Array (_ BitVec 32) ValueCell!6633)) (size!21686 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44408)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2123 (array!44406 array!44408 (_ BitVec 32) (_ BitVec 32) V!23797 V!23797 (_ BitVec 32) Int) ListLongMap!8115)

(assert (=> b!813145 (= lt!364242 (getCurrentListMapNoExtraKeys!2123 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813146 () Bool)

(declare-fun res!555552 () Bool)

(assert (=> b!813146 (=> (not res!555552) (not e!450539))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813146 (= res!555552 (and (= (size!21686 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21685 _keys!976) (size!21686 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555554 () Bool)

(assert (=> start!69954 (=> (not res!555554) (not e!450539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69954 (= res!555554 (validMask!0 mask!1312))))

(assert (=> start!69954 e!450539))

(declare-fun tp_is_empty!14097 () Bool)

(assert (=> start!69954 tp_is_empty!14097))

(declare-fun array_inv!17027 (array!44406) Bool)

(assert (=> start!69954 (array_inv!17027 _keys!976)))

(assert (=> start!69954 true))

(declare-fun e!450538 () Bool)

(declare-fun array_inv!17028 (array!44408) Bool)

(assert (=> start!69954 (and (array_inv!17028 _values!788) e!450538)))

(assert (=> start!69954 tp!43872))

(declare-fun b!813147 () Bool)

(declare-fun e!450537 () Bool)

(declare-fun mapRes!22723 () Bool)

(assert (=> b!813147 (= e!450538 (and e!450537 mapRes!22723))))

(declare-fun condMapEmpty!22723 () Bool)

(declare-fun mapDefault!22723 () ValueCell!6633)

(assert (=> b!813147 (= condMapEmpty!22723 (= (arr!21265 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6633)) mapDefault!22723)))))

(declare-fun b!813148 () Bool)

(declare-fun res!555555 () Bool)

(assert (=> b!813148 (=> (not res!555555) (not e!450539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44406 (_ BitVec 32)) Bool)

(assert (=> b!813148 (= res!555555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813149 () Bool)

(assert (=> b!813149 (= e!450537 tp_is_empty!14097)))

(declare-fun b!813150 () Bool)

(declare-fun res!555553 () Bool)

(assert (=> b!813150 (=> (not res!555553) (not e!450539))))

(declare-datatypes ((List!15125 0))(
  ( (Nil!15122) (Cons!15121 (h!16250 (_ BitVec 64)) (t!21440 List!15125)) )
))
(declare-fun arrayNoDuplicates!0 (array!44406 (_ BitVec 32) List!15125) Bool)

(assert (=> b!813150 (= res!555553 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15122))))

(declare-fun b!813151 () Bool)

(declare-fun e!450540 () Bool)

(assert (=> b!813151 (= e!450540 tp_is_empty!14097)))

(declare-fun mapIsEmpty!22723 () Bool)

(assert (=> mapIsEmpty!22723 mapRes!22723))

(declare-fun mapNonEmpty!22723 () Bool)

(declare-fun tp!43873 () Bool)

(assert (=> mapNonEmpty!22723 (= mapRes!22723 (and tp!43873 e!450540))))

(declare-fun mapValue!22723 () ValueCell!6633)

(declare-fun mapKey!22723 () (_ BitVec 32))

(declare-fun mapRest!22723 () (Array (_ BitVec 32) ValueCell!6633))

(assert (=> mapNonEmpty!22723 (= (arr!21265 _values!788) (store mapRest!22723 mapKey!22723 mapValue!22723))))

(assert (= (and start!69954 res!555554) b!813146))

(assert (= (and b!813146 res!555552) b!813148))

(assert (= (and b!813148 res!555555) b!813150))

(assert (= (and b!813150 res!555553) b!813145))

(assert (= (and b!813147 condMapEmpty!22723) mapIsEmpty!22723))

(assert (= (and b!813147 (not condMapEmpty!22723)) mapNonEmpty!22723))

(get-info :version)

(assert (= (and mapNonEmpty!22723 ((_ is ValueCellFull!6633) mapValue!22723)) b!813151))

(assert (= (and b!813147 ((_ is ValueCellFull!6633) mapDefault!22723)) b!813149))

(assert (= start!69954 b!813147))

(declare-fun m!755285 () Bool)

(assert (=> b!813145 m!755285))

(declare-fun m!755287 () Bool)

(assert (=> mapNonEmpty!22723 m!755287))

(declare-fun m!755289 () Bool)

(assert (=> start!69954 m!755289))

(declare-fun m!755291 () Bool)

(assert (=> start!69954 m!755291))

(declare-fun m!755293 () Bool)

(assert (=> start!69954 m!755293))

(declare-fun m!755295 () Bool)

(assert (=> b!813148 m!755295))

(declare-fun m!755297 () Bool)

(assert (=> b!813150 m!755297))

(check-sat (not b!813148) (not b_next!12387) b_and!21155 (not b!813150) tp_is_empty!14097 (not mapNonEmpty!22723) (not b!813145) (not start!69954))
(check-sat b_and!21155 (not b_next!12387))
