; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107920 () Bool)

(assert start!107920)

(declare-fun b!1275252 () Bool)

(declare-fun e!727937 () Bool)

(declare-fun tp_is_empty!33237 () Bool)

(assert (=> b!1275252 (= e!727937 tp_is_empty!33237)))

(declare-fun b!1275253 () Bool)

(declare-fun e!727935 () Bool)

(assert (=> b!1275253 (= e!727935 tp_is_empty!33237)))

(declare-fun mapIsEmpty!51368 () Bool)

(declare-fun mapRes!51368 () Bool)

(assert (=> mapIsEmpty!51368 mapRes!51368))

(declare-fun res!847675 () Bool)

(declare-fun e!727936 () Bool)

(assert (=> start!107920 (=> (not res!847675) (not e!727936))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107920 (= res!847675 (validMask!0 mask!1805))))

(assert (=> start!107920 e!727936))

(assert (=> start!107920 true))

(declare-datatypes ((V!49419 0))(
  ( (V!49420 (val!16693 Int)) )
))
(declare-datatypes ((ValueCell!15720 0))(
  ( (ValueCellFull!15720 (v!19289 V!49419)) (EmptyCell!15720) )
))
(declare-datatypes ((array!83582 0))(
  ( (array!83583 (arr!40308 (Array (_ BitVec 32) ValueCell!15720)) (size!40858 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83582)

(declare-fun e!727938 () Bool)

(declare-fun array_inv!30641 (array!83582) Bool)

(assert (=> start!107920 (and (array_inv!30641 _values!1187) e!727938)))

(declare-datatypes ((array!83584 0))(
  ( (array!83585 (arr!40309 (Array (_ BitVec 32) (_ BitVec 64))) (size!40859 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83584)

(declare-fun array_inv!30642 (array!83584) Bool)

(assert (=> start!107920 (array_inv!30642 _keys!1427)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun b!1275254 () Bool)

(assert (=> b!1275254 (= e!727936 (and (= (size!40858 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40859 _keys!1427) (size!40858 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011) (not (= (size!40859 _keys!1427) (bvadd #b00000000000000000000000000000001 mask!1805)))))))

(declare-fun b!1275255 () Bool)

(assert (=> b!1275255 (= e!727938 (and e!727935 mapRes!51368))))

(declare-fun condMapEmpty!51368 () Bool)

(declare-fun mapDefault!51368 () ValueCell!15720)

(assert (=> b!1275255 (= condMapEmpty!51368 (= (arr!40308 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15720)) mapDefault!51368)))))

(declare-fun mapNonEmpty!51368 () Bool)

(declare-fun tp!98126 () Bool)

(assert (=> mapNonEmpty!51368 (= mapRes!51368 (and tp!98126 e!727937))))

(declare-fun mapKey!51368 () (_ BitVec 32))

(declare-fun mapValue!51368 () ValueCell!15720)

(declare-fun mapRest!51368 () (Array (_ BitVec 32) ValueCell!15720))

(assert (=> mapNonEmpty!51368 (= (arr!40308 _values!1187) (store mapRest!51368 mapKey!51368 mapValue!51368))))

(assert (= (and start!107920 res!847675) b!1275254))

(assert (= (and b!1275255 condMapEmpty!51368) mapIsEmpty!51368))

(assert (= (and b!1275255 (not condMapEmpty!51368)) mapNonEmpty!51368))

(get-info :version)

(assert (= (and mapNonEmpty!51368 ((_ is ValueCellFull!15720) mapValue!51368)) b!1275252))

(assert (= (and b!1275255 ((_ is ValueCellFull!15720) mapDefault!51368)) b!1275253))

(assert (= start!107920 b!1275255))

(declare-fun m!1171575 () Bool)

(assert (=> start!107920 m!1171575))

(declare-fun m!1171577 () Bool)

(assert (=> start!107920 m!1171577))

(declare-fun m!1171579 () Bool)

(assert (=> start!107920 m!1171579))

(declare-fun m!1171581 () Bool)

(assert (=> mapNonEmpty!51368 m!1171581))

(check-sat (not start!107920) (not mapNonEmpty!51368) tp_is_empty!33237)
(check-sat)
