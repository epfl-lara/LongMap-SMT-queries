; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107548 () Bool)

(assert start!107548)

(declare-fun b!1273255 () Bool)

(declare-fun e!726276 () Bool)

(declare-fun tp_is_empty!33013 () Bool)

(assert (=> b!1273255 (= e!726276 tp_is_empty!33013)))

(declare-fun mapNonEmpty!51100 () Bool)

(declare-fun mapRes!51100 () Bool)

(declare-fun tp!97441 () Bool)

(declare-fun e!726279 () Bool)

(assert (=> mapNonEmpty!51100 (= mapRes!51100 (and tp!97441 e!726279))))

(declare-datatypes ((V!49211 0))(
  ( (V!49212 (val!16581 Int)) )
))
(declare-datatypes ((ValueCell!15653 0))(
  ( (ValueCellFull!15653 (v!19213 V!49211)) (EmptyCell!15653) )
))
(declare-fun mapValue!51100 () ValueCell!15653)

(declare-fun mapKey!51100 () (_ BitVec 32))

(declare-fun mapRest!51100 () (Array (_ BitVec 32) ValueCell!15653))

(declare-datatypes ((array!83291 0))(
  ( (array!83292 (arr!40178 (Array (_ BitVec 32) ValueCell!15653)) (size!40715 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83291)

(assert (=> mapNonEmpty!51100 (= (arr!40178 _values!1134) (store mapRest!51100 mapKey!51100 mapValue!51100))))

(declare-fun mapIsEmpty!51100 () Bool)

(assert (=> mapIsEmpty!51100 mapRes!51100))

(declare-fun b!1273256 () Bool)

(declare-fun e!726277 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!83293 0))(
  ( (array!83294 (arr!40179 (Array (_ BitVec 32) (_ BitVec 64))) (size!40716 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83293)

(assert (=> b!1273256 (= e!726277 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40716 _keys!1364)) (bvslt from!1698 (size!40716 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvsge (bvsub (size!40716 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (bvsub (size!40716 _keys!1364) from!1698))))))

(declare-fun b!1273257 () Bool)

(declare-fun e!726280 () Bool)

(assert (=> b!1273257 (= e!726280 (and e!726276 mapRes!51100))))

(declare-fun condMapEmpty!51100 () Bool)

(declare-fun mapDefault!51100 () ValueCell!15653)

(assert (=> b!1273257 (= condMapEmpty!51100 (= (arr!40178 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15653)) mapDefault!51100)))))

(declare-fun b!1273259 () Bool)

(declare-fun res!846694 () Bool)

(assert (=> b!1273259 (=> (not res!846694) (not e!726277))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1273259 (= res!846694 (and (= (size!40715 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40716 _keys!1364) (size!40715 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1273260 () Bool)

(declare-fun res!846693 () Bool)

(assert (=> b!1273260 (=> (not res!846693) (not e!726277))))

(declare-datatypes ((List!28572 0))(
  ( (Nil!28569) (Cons!28568 (h!29786 (_ BitVec 64)) (t!42093 List!28572)) )
))
(declare-fun arrayNoDuplicates!0 (array!83293 (_ BitVec 32) List!28572) Bool)

(assert (=> b!1273260 (= res!846693 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28569))))

(declare-fun b!1273261 () Bool)

(declare-fun res!846696 () Bool)

(assert (=> b!1273261 (=> (not res!846696) (not e!726277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83293 (_ BitVec 32)) Bool)

(assert (=> b!1273261 (= res!846696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1273258 () Bool)

(assert (=> b!1273258 (= e!726279 tp_is_empty!33013)))

(declare-fun res!846695 () Bool)

(assert (=> start!107548 (=> (not res!846695) (not e!726277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107548 (= res!846695 (validMask!0 mask!1730))))

(assert (=> start!107548 e!726277))

(declare-fun array_inv!30723 (array!83291) Bool)

(assert (=> start!107548 (and (array_inv!30723 _values!1134) e!726280)))

(assert (=> start!107548 true))

(declare-fun array_inv!30724 (array!83293) Bool)

(assert (=> start!107548 (array_inv!30724 _keys!1364)))

(assert (= (and start!107548 res!846695) b!1273259))

(assert (= (and b!1273259 res!846694) b!1273261))

(assert (= (and b!1273261 res!846696) b!1273260))

(assert (= (and b!1273260 res!846693) b!1273256))

(assert (= (and b!1273257 condMapEmpty!51100) mapIsEmpty!51100))

(assert (= (and b!1273257 (not condMapEmpty!51100)) mapNonEmpty!51100))

(get-info :version)

(assert (= (and mapNonEmpty!51100 ((_ is ValueCellFull!15653) mapValue!51100)) b!1273258))

(assert (= (and b!1273257 ((_ is ValueCellFull!15653) mapDefault!51100)) b!1273255))

(assert (= start!107548 b!1273257))

(declare-fun m!1171335 () Bool)

(assert (=> mapNonEmpty!51100 m!1171335))

(declare-fun m!1171337 () Bool)

(assert (=> b!1273260 m!1171337))

(declare-fun m!1171339 () Bool)

(assert (=> b!1273261 m!1171339))

(declare-fun m!1171341 () Bool)

(assert (=> start!107548 m!1171341))

(declare-fun m!1171343 () Bool)

(assert (=> start!107548 m!1171343))

(declare-fun m!1171345 () Bool)

(assert (=> start!107548 m!1171345))

(check-sat (not b!1273261) tp_is_empty!33013 (not mapNonEmpty!51100) (not b!1273260) (not start!107548))
(check-sat)
