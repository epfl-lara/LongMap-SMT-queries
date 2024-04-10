; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43356 () Bool)

(assert start!43356)

(declare-fun b_free!12183 () Bool)

(declare-fun b_next!12183 () Bool)

(assert (=> start!43356 (= b_free!12183 (not b_next!12183))))

(declare-fun tp!42825 () Bool)

(declare-fun b_and!20939 () Bool)

(assert (=> start!43356 (= tp!42825 b_and!20939)))

(declare-fun b!480231 () Bool)

(declare-fun res!286406 () Bool)

(declare-fun e!282581 () Bool)

(assert (=> b!480231 (=> (not res!286406) (not e!282581))))

(declare-datatypes ((array!31059 0))(
  ( (array!31060 (arr!14934 (Array (_ BitVec 32) (_ BitVec 64))) (size!15292 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31059)

(declare-datatypes ((List!9129 0))(
  ( (Nil!9126) (Cons!9125 (h!9981 (_ BitVec 64)) (t!15339 List!9129)) )
))
(declare-fun arrayNoDuplicates!0 (array!31059 (_ BitVec 32) List!9129) Bool)

(assert (=> b!480231 (= res!286406 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9126))))

(declare-fun b!480232 () Bool)

(declare-fun res!286403 () Bool)

(assert (=> b!480232 (=> (not res!286403) (not e!282581))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19331 0))(
  ( (V!19332 (val!6895 Int)) )
))
(declare-datatypes ((ValueCell!6486 0))(
  ( (ValueCellFull!6486 (v!9186 V!19331)) (EmptyCell!6486) )
))
(declare-datatypes ((array!31061 0))(
  ( (array!31062 (arr!14935 (Array (_ BitVec 32) ValueCell!6486)) (size!15293 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31061)

(assert (=> b!480232 (= res!286403 (and (= (size!15293 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15292 _keys!1874) (size!15293 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480233 () Bool)

(declare-fun res!286405 () Bool)

(assert (=> b!480233 (=> (not res!286405) (not e!282581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31059 (_ BitVec 32)) Bool)

(assert (=> b!480233 (= res!286405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480234 () Bool)

(declare-fun e!282583 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(assert (=> b!480234 (= e!282583 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480235 () Bool)

(assert (=> b!480235 (= e!282581 (not true))))

(declare-fun lt!218113 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31059 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480235 (= lt!218113 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480235 e!282583))

(declare-fun c!57760 () Bool)

(assert (=> b!480235 (= c!57760 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19331)

(declare-datatypes ((Unit!14080 0))(
  ( (Unit!14081) )
))
(declare-fun lt!218112 () Unit!14080)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19331)

(declare-fun lemmaKeyInListMapIsInArray!113 (array!31059 array!31061 (_ BitVec 32) (_ BitVec 32) V!19331 V!19331 (_ BitVec 64) Int) Unit!14080)

(assert (=> b!480235 (= lt!218112 (lemmaKeyInListMapIsInArray!113 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480236 () Bool)

(declare-fun e!282580 () Bool)

(declare-fun e!282584 () Bool)

(declare-fun mapRes!22246 () Bool)

(assert (=> b!480236 (= e!282580 (and e!282584 mapRes!22246))))

(declare-fun condMapEmpty!22246 () Bool)

(declare-fun mapDefault!22246 () ValueCell!6486)

(assert (=> b!480236 (= condMapEmpty!22246 (= (arr!14935 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6486)) mapDefault!22246)))))

(declare-fun b!480237 () Bool)

(declare-fun res!286404 () Bool)

(assert (=> b!480237 (=> (not res!286404) (not e!282581))))

(declare-datatypes ((tuple2!9052 0))(
  ( (tuple2!9053 (_1!4537 (_ BitVec 64)) (_2!4537 V!19331)) )
))
(declare-datatypes ((List!9130 0))(
  ( (Nil!9127) (Cons!9126 (h!9982 tuple2!9052) (t!15340 List!9130)) )
))
(declare-datatypes ((ListLongMap!7965 0))(
  ( (ListLongMap!7966 (toList!3998 List!9130)) )
))
(declare-fun contains!2610 (ListLongMap!7965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2317 (array!31059 array!31061 (_ BitVec 32) (_ BitVec 32) V!19331 V!19331 (_ BitVec 32) Int) ListLongMap!7965)

(assert (=> b!480237 (= res!286404 (contains!2610 (getCurrentListMap!2317 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480238 () Bool)

(declare-fun res!286402 () Bool)

(assert (=> b!480238 (=> (not res!286402) (not e!282581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480238 (= res!286402 (validKeyInArray!0 k0!1332))))

(declare-fun mapIsEmpty!22246 () Bool)

(assert (=> mapIsEmpty!22246 mapRes!22246))

(declare-fun res!286407 () Bool)

(assert (=> start!43356 (=> (not res!286407) (not e!282581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43356 (= res!286407 (validMask!0 mask!2352))))

(assert (=> start!43356 e!282581))

(assert (=> start!43356 true))

(declare-fun tp_is_empty!13695 () Bool)

(assert (=> start!43356 tp_is_empty!13695))

(declare-fun array_inv!10772 (array!31061) Bool)

(assert (=> start!43356 (and (array_inv!10772 _values!1516) e!282580)))

(assert (=> start!43356 tp!42825))

(declare-fun array_inv!10773 (array!31059) Bool)

(assert (=> start!43356 (array_inv!10773 _keys!1874)))

(declare-fun b!480239 () Bool)

(assert (=> b!480239 (= e!282584 tp_is_empty!13695)))

(declare-fun b!480240 () Bool)

(declare-fun arrayContainsKey!0 (array!31059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480240 (= e!282583 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480241 () Bool)

(declare-fun e!282585 () Bool)

(assert (=> b!480241 (= e!282585 tp_is_empty!13695)))

(declare-fun mapNonEmpty!22246 () Bool)

(declare-fun tp!42826 () Bool)

(assert (=> mapNonEmpty!22246 (= mapRes!22246 (and tp!42826 e!282585))))

(declare-fun mapRest!22246 () (Array (_ BitVec 32) ValueCell!6486))

(declare-fun mapKey!22246 () (_ BitVec 32))

(declare-fun mapValue!22246 () ValueCell!6486)

(assert (=> mapNonEmpty!22246 (= (arr!14935 _values!1516) (store mapRest!22246 mapKey!22246 mapValue!22246))))

(assert (= (and start!43356 res!286407) b!480232))

(assert (= (and b!480232 res!286403) b!480233))

(assert (= (and b!480233 res!286405) b!480231))

(assert (= (and b!480231 res!286406) b!480237))

(assert (= (and b!480237 res!286404) b!480238))

(assert (= (and b!480238 res!286402) b!480235))

(assert (= (and b!480235 c!57760) b!480240))

(assert (= (and b!480235 (not c!57760)) b!480234))

(assert (= (and b!480236 condMapEmpty!22246) mapIsEmpty!22246))

(assert (= (and b!480236 (not condMapEmpty!22246)) mapNonEmpty!22246))

(get-info :version)

(assert (= (and mapNonEmpty!22246 ((_ is ValueCellFull!6486) mapValue!22246)) b!480241))

(assert (= (and b!480236 ((_ is ValueCellFull!6486) mapDefault!22246)) b!480239))

(assert (= start!43356 b!480236))

(declare-fun m!461939 () Bool)

(assert (=> b!480231 m!461939))

(declare-fun m!461941 () Bool)

(assert (=> b!480233 m!461941))

(declare-fun m!461943 () Bool)

(assert (=> b!480240 m!461943))

(declare-fun m!461945 () Bool)

(assert (=> mapNonEmpty!22246 m!461945))

(declare-fun m!461947 () Bool)

(assert (=> b!480238 m!461947))

(declare-fun m!461949 () Bool)

(assert (=> b!480235 m!461949))

(declare-fun m!461951 () Bool)

(assert (=> b!480235 m!461951))

(declare-fun m!461953 () Bool)

(assert (=> b!480237 m!461953))

(assert (=> b!480237 m!461953))

(declare-fun m!461955 () Bool)

(assert (=> b!480237 m!461955))

(declare-fun m!461957 () Bool)

(assert (=> start!43356 m!461957))

(declare-fun m!461959 () Bool)

(assert (=> start!43356 m!461959))

(declare-fun m!461961 () Bool)

(assert (=> start!43356 m!461961))

(check-sat (not b!480231) tp_is_empty!13695 (not b!480238) b_and!20939 (not start!43356) (not b!480240) (not b!480235) (not b!480233) (not mapNonEmpty!22246) (not b!480237) (not b_next!12183))
(check-sat b_and!20939 (not b_next!12183))
