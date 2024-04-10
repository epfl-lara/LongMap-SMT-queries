; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69902 () Bool)

(assert start!69902)

(declare-fun mapIsEmpty!22657 () Bool)

(declare-fun mapRes!22657 () Bool)

(assert (=> mapIsEmpty!22657 mapRes!22657))

(declare-fun b!812682 () Bool)

(declare-fun e!450195 () Bool)

(declare-fun tp_is_empty!14055 () Bool)

(assert (=> b!812682 (= e!450195 tp_is_empty!14055)))

(declare-fun res!555299 () Bool)

(declare-fun e!450194 () Bool)

(assert (=> start!69902 (=> (not res!555299) (not e!450194))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69902 (= res!555299 (validMask!0 mask!1312))))

(assert (=> start!69902 e!450194))

(declare-datatypes ((array!44328 0))(
  ( (array!44329 (arr!21226 (Array (_ BitVec 32) (_ BitVec 64))) (size!21647 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44328)

(declare-fun array_inv!17005 (array!44328) Bool)

(assert (=> start!69902 (array_inv!17005 _keys!976)))

(assert (=> start!69902 true))

(declare-datatypes ((V!23741 0))(
  ( (V!23742 (val!7075 Int)) )
))
(declare-datatypes ((ValueCell!6612 0))(
  ( (ValueCellFull!6612 (v!9502 V!23741)) (EmptyCell!6612) )
))
(declare-datatypes ((array!44330 0))(
  ( (array!44331 (arr!21227 (Array (_ BitVec 32) ValueCell!6612)) (size!21648 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44330)

(declare-fun e!450198 () Bool)

(declare-fun array_inv!17006 (array!44330) Bool)

(assert (=> start!69902 (and (array_inv!17006 _values!788) e!450198)))

(declare-fun mapNonEmpty!22657 () Bool)

(declare-fun tp!43765 () Bool)

(declare-fun e!450197 () Bool)

(assert (=> mapNonEmpty!22657 (= mapRes!22657 (and tp!43765 e!450197))))

(declare-fun mapValue!22657 () ValueCell!6612)

(declare-fun mapKey!22657 () (_ BitVec 32))

(declare-fun mapRest!22657 () (Array (_ BitVec 32) ValueCell!6612))

(assert (=> mapNonEmpty!22657 (= (arr!21227 _values!788) (store mapRest!22657 mapKey!22657 mapValue!22657))))

(declare-fun b!812683 () Bool)

(declare-fun res!555300 () Bool)

(assert (=> b!812683 (=> (not res!555300) (not e!450194))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812683 (= res!555300 (and (= (size!21648 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21647 _keys!976) (size!21648 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812684 () Bool)

(assert (=> b!812684 (= e!450194 false)))

(declare-fun lt!364179 () Bool)

(declare-datatypes ((List!15104 0))(
  ( (Nil!15101) (Cons!15100 (h!16229 (_ BitVec 64)) (t!21419 List!15104)) )
))
(declare-fun arrayNoDuplicates!0 (array!44328 (_ BitVec 32) List!15104) Bool)

(assert (=> b!812684 (= lt!364179 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15101))))

(declare-fun b!812685 () Bool)

(declare-fun res!555298 () Bool)

(assert (=> b!812685 (=> (not res!555298) (not e!450194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44328 (_ BitVec 32)) Bool)

(assert (=> b!812685 (= res!555298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812686 () Bool)

(assert (=> b!812686 (= e!450198 (and e!450195 mapRes!22657))))

(declare-fun condMapEmpty!22657 () Bool)

(declare-fun mapDefault!22657 () ValueCell!6612)

(assert (=> b!812686 (= condMapEmpty!22657 (= (arr!21227 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6612)) mapDefault!22657)))))

(declare-fun b!812687 () Bool)

(assert (=> b!812687 (= e!450197 tp_is_empty!14055)))

(assert (= (and start!69902 res!555299) b!812683))

(assert (= (and b!812683 res!555300) b!812685))

(assert (= (and b!812685 res!555298) b!812684))

(assert (= (and b!812686 condMapEmpty!22657) mapIsEmpty!22657))

(assert (= (and b!812686 (not condMapEmpty!22657)) mapNonEmpty!22657))

(get-info :version)

(assert (= (and mapNonEmpty!22657 ((_ is ValueCellFull!6612) mapValue!22657)) b!812687))

(assert (= (and b!812686 ((_ is ValueCellFull!6612) mapDefault!22657)) b!812682))

(assert (= start!69902 b!812686))

(declare-fun m!754989 () Bool)

(assert (=> start!69902 m!754989))

(declare-fun m!754991 () Bool)

(assert (=> start!69902 m!754991))

(declare-fun m!754993 () Bool)

(assert (=> start!69902 m!754993))

(declare-fun m!754995 () Bool)

(assert (=> mapNonEmpty!22657 m!754995))

(declare-fun m!754997 () Bool)

(assert (=> b!812684 m!754997))

(declare-fun m!754999 () Bool)

(assert (=> b!812685 m!754999))

(check-sat (not b!812684) tp_is_empty!14055 (not start!69902) (not b!812685) (not mapNonEmpty!22657))
(check-sat)
