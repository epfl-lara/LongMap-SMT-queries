; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83896 () Bool)

(assert start!83896)

(declare-fun b_free!19723 () Bool)

(declare-fun b_next!19723 () Bool)

(assert (=> start!83896 (= b_free!19723 (not b_next!19723))))

(declare-fun tp!68611 () Bool)

(declare-fun b_and!31509 () Bool)

(assert (=> start!83896 (= tp!68611 b_and!31509)))

(declare-fun b!980457 () Bool)

(declare-fun res!656218 () Bool)

(declare-fun e!552611 () Bool)

(assert (=> b!980457 (=> (not res!656218) (not e!552611))))

(declare-datatypes ((array!61368 0))(
  ( (array!61369 (arr!29542 (Array (_ BitVec 32) (_ BitVec 64))) (size!30023 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61368)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61368 (_ BitVec 32)) Bool)

(assert (=> b!980457 (= res!656218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980458 () Bool)

(declare-fun res!656220 () Bool)

(assert (=> b!980458 (=> (not res!656220) (not e!552611))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980458 (= res!656220 (validKeyInArray!0 (select (arr!29542 _keys!1544) from!1932)))))

(declare-fun b!980459 () Bool)

(declare-fun e!552612 () Bool)

(assert (=> b!980459 (= e!552611 (not e!552612))))

(declare-fun res!656219 () Bool)

(assert (=> b!980459 (=> res!656219 e!552612)))

(assert (=> b!980459 (= res!656219 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29542 _keys!1544) from!1932)))))

(declare-datatypes ((V!35273 0))(
  ( (V!35274 (val!11409 Int)) )
))
(declare-datatypes ((tuple2!14706 0))(
  ( (tuple2!14707 (_1!7364 (_ BitVec 64)) (_2!7364 V!35273)) )
))
(declare-datatypes ((List!20529 0))(
  ( (Nil!20526) (Cons!20525 (h!21687 tuple2!14706) (t!29199 List!20529)) )
))
(declare-datatypes ((ListLongMap!13393 0))(
  ( (ListLongMap!13394 (toList!6712 List!20529)) )
))
(declare-fun lt!435301 () ListLongMap!13393)

(declare-fun lt!435296 () tuple2!14706)

(declare-fun lt!435303 () tuple2!14706)

(declare-fun lt!435295 () ListLongMap!13393)

(declare-fun +!3012 (ListLongMap!13393 tuple2!14706) ListLongMap!13393)

(assert (=> b!980459 (= (+!3012 lt!435301 lt!435296) (+!3012 lt!435295 lt!435303))))

(declare-fun lt!435300 () ListLongMap!13393)

(assert (=> b!980459 (= lt!435295 (+!3012 lt!435300 lt!435296))))

(declare-fun lt!435302 () V!35273)

(assert (=> b!980459 (= lt!435296 (tuple2!14707 (select (arr!29542 _keys!1544) from!1932) lt!435302))))

(assert (=> b!980459 (= lt!435301 (+!3012 lt!435300 lt!435303))))

(declare-fun minValue!1220 () V!35273)

(assert (=> b!980459 (= lt!435303 (tuple2!14707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32490 0))(
  ( (Unit!32491) )
))
(declare-fun lt!435297 () Unit!32490)

(declare-fun addCommutativeForDiffKeys!616 (ListLongMap!13393 (_ BitVec 64) V!35273 (_ BitVec 64) V!35273) Unit!32490)

(assert (=> b!980459 (= lt!435297 (addCommutativeForDiffKeys!616 lt!435300 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29542 _keys!1544) from!1932) lt!435302))))

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((ValueCell!10877 0))(
  ( (ValueCellFull!10877 (v!13970 V!35273)) (EmptyCell!10877) )
))
(declare-datatypes ((array!61370 0))(
  ( (array!61371 (arr!29543 (Array (_ BitVec 32) ValueCell!10877)) (size!30024 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61370)

(declare-fun get!15330 (ValueCell!10877 V!35273) V!35273)

(declare-fun dynLambda!1758 (Int (_ BitVec 64)) V!35273)

(assert (=> b!980459 (= lt!435302 (get!15330 (select (arr!29543 _values!1278) from!1932) (dynLambda!1758 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435299 () ListLongMap!13393)

(declare-fun lt!435298 () tuple2!14706)

(assert (=> b!980459 (= lt!435300 (+!3012 lt!435299 lt!435298))))

(declare-fun zeroValue!1220 () V!35273)

(assert (=> b!980459 (= lt!435298 (tuple2!14707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3425 (array!61368 array!61370 (_ BitVec 32) (_ BitVec 32) V!35273 V!35273 (_ BitVec 32) Int) ListLongMap!13393)

(assert (=> b!980459 (= lt!435299 (getCurrentListMapNoExtraKeys!3425 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980460 () Bool)

(assert (=> b!980460 (= e!552612 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000))))

(assert (=> b!980460 (= lt!435295 (+!3012 (+!3012 lt!435299 lt!435296) lt!435298))))

(declare-fun lt!435294 () Unit!32490)

(assert (=> b!980460 (= lt!435294 (addCommutativeForDiffKeys!616 lt!435299 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29542 _keys!1544) from!1932) lt!435302))))

(declare-fun b!980461 () Bool)

(declare-fun e!552610 () Bool)

(declare-fun e!552609 () Bool)

(declare-fun mapRes!36104 () Bool)

(assert (=> b!980461 (= e!552610 (and e!552609 mapRes!36104))))

(declare-fun condMapEmpty!36104 () Bool)

(declare-fun mapDefault!36104 () ValueCell!10877)

(assert (=> b!980461 (= condMapEmpty!36104 (= (arr!29543 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10877)) mapDefault!36104)))))

(declare-fun b!980462 () Bool)

(declare-fun tp_is_empty!22717 () Bool)

(assert (=> b!980462 (= e!552609 tp_is_empty!22717)))

(declare-fun b!980463 () Bool)

(declare-fun res!656222 () Bool)

(assert (=> b!980463 (=> (not res!656222) (not e!552611))))

(declare-datatypes ((List!20530 0))(
  ( (Nil!20527) (Cons!20526 (h!21688 (_ BitVec 64)) (t!29200 List!20530)) )
))
(declare-fun arrayNoDuplicates!0 (array!61368 (_ BitVec 32) List!20530) Bool)

(assert (=> b!980463 (= res!656222 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20527))))

(declare-fun b!980464 () Bool)

(declare-fun e!552614 () Bool)

(assert (=> b!980464 (= e!552614 tp_is_empty!22717)))

(declare-fun mapNonEmpty!36104 () Bool)

(declare-fun tp!68612 () Bool)

(assert (=> mapNonEmpty!36104 (= mapRes!36104 (and tp!68612 e!552614))))

(declare-fun mapRest!36104 () (Array (_ BitVec 32) ValueCell!10877))

(declare-fun mapValue!36104 () ValueCell!10877)

(declare-fun mapKey!36104 () (_ BitVec 32))

(assert (=> mapNonEmpty!36104 (= (arr!29543 _values!1278) (store mapRest!36104 mapKey!36104 mapValue!36104))))

(declare-fun b!980465 () Bool)

(declare-fun res!656217 () Bool)

(assert (=> b!980465 (=> (not res!656217) (not e!552611))))

(assert (=> b!980465 (= res!656217 (and (= (size!30024 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30023 _keys!1544) (size!30024 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980466 () Bool)

(declare-fun res!656223 () Bool)

(assert (=> b!980466 (=> (not res!656223) (not e!552611))))

(assert (=> b!980466 (= res!656223 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30023 _keys!1544))))))

(declare-fun b!980467 () Bool)

(declare-fun res!656216 () Bool)

(assert (=> b!980467 (=> (not res!656216) (not e!552611))))

(assert (=> b!980467 (= res!656216 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36104 () Bool)

(assert (=> mapIsEmpty!36104 mapRes!36104))

(declare-fun res!656221 () Bool)

(assert (=> start!83896 (=> (not res!656221) (not e!552611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83896 (= res!656221 (validMask!0 mask!1948))))

(assert (=> start!83896 e!552611))

(assert (=> start!83896 true))

(assert (=> start!83896 tp_is_empty!22717))

(declare-fun array_inv!22863 (array!61370) Bool)

(assert (=> start!83896 (and (array_inv!22863 _values!1278) e!552610)))

(assert (=> start!83896 tp!68611))

(declare-fun array_inv!22864 (array!61368) Bool)

(assert (=> start!83896 (array_inv!22864 _keys!1544)))

(assert (= (and start!83896 res!656221) b!980465))

(assert (= (and b!980465 res!656217) b!980457))

(assert (= (and b!980457 res!656218) b!980463))

(assert (= (and b!980463 res!656222) b!980466))

(assert (= (and b!980466 res!656223) b!980458))

(assert (= (and b!980458 res!656220) b!980467))

(assert (= (and b!980467 res!656216) b!980459))

(assert (= (and b!980459 (not res!656219)) b!980460))

(assert (= (and b!980461 condMapEmpty!36104) mapIsEmpty!36104))

(assert (= (and b!980461 (not condMapEmpty!36104)) mapNonEmpty!36104))

(get-info :version)

(assert (= (and mapNonEmpty!36104 ((_ is ValueCellFull!10877) mapValue!36104)) b!980464))

(assert (= (and b!980461 ((_ is ValueCellFull!10877) mapDefault!36104)) b!980462))

(assert (= start!83896 b!980461))

(declare-fun b_lambda!14749 () Bool)

(assert (=> (not b_lambda!14749) (not b!980459)))

(declare-fun t!29198 () Bool)

(declare-fun tb!6521 () Bool)

(assert (=> (and start!83896 (= defaultEntry!1281 defaultEntry!1281) t!29198) tb!6521))

(declare-fun result!13039 () Bool)

(assert (=> tb!6521 (= result!13039 tp_is_empty!22717)))

(assert (=> b!980459 t!29198))

(declare-fun b_and!31511 () Bool)

(assert (= b_and!31509 (and (=> t!29198 result!13039) b_and!31511)))

(declare-fun m!907499 () Bool)

(assert (=> b!980463 m!907499))

(declare-fun m!907501 () Bool)

(assert (=> b!980457 m!907501))

(declare-fun m!907503 () Bool)

(assert (=> b!980458 m!907503))

(assert (=> b!980458 m!907503))

(declare-fun m!907505 () Bool)

(assert (=> b!980458 m!907505))

(declare-fun m!907507 () Bool)

(assert (=> start!83896 m!907507))

(declare-fun m!907509 () Bool)

(assert (=> start!83896 m!907509))

(declare-fun m!907511 () Bool)

(assert (=> start!83896 m!907511))

(declare-fun m!907513 () Bool)

(assert (=> mapNonEmpty!36104 m!907513))

(declare-fun m!907515 () Bool)

(assert (=> b!980459 m!907515))

(assert (=> b!980459 m!907503))

(declare-fun m!907517 () Bool)

(assert (=> b!980459 m!907517))

(assert (=> b!980459 m!907503))

(declare-fun m!907519 () Bool)

(assert (=> b!980459 m!907519))

(declare-fun m!907521 () Bool)

(assert (=> b!980459 m!907521))

(declare-fun m!907523 () Bool)

(assert (=> b!980459 m!907523))

(declare-fun m!907525 () Bool)

(assert (=> b!980459 m!907525))

(declare-fun m!907527 () Bool)

(assert (=> b!980459 m!907527))

(declare-fun m!907529 () Bool)

(assert (=> b!980459 m!907529))

(declare-fun m!907531 () Bool)

(assert (=> b!980459 m!907531))

(assert (=> b!980459 m!907517))

(assert (=> b!980459 m!907531))

(declare-fun m!907533 () Bool)

(assert (=> b!980459 m!907533))

(declare-fun m!907535 () Bool)

(assert (=> b!980460 m!907535))

(assert (=> b!980460 m!907535))

(declare-fun m!907537 () Bool)

(assert (=> b!980460 m!907537))

(assert (=> b!980460 m!907503))

(assert (=> b!980460 m!907503))

(declare-fun m!907539 () Bool)

(assert (=> b!980460 m!907539))

(check-sat tp_is_empty!22717 (not b!980463) (not b_next!19723) (not mapNonEmpty!36104) b_and!31511 (not b!980459) (not start!83896) (not b!980460) (not b!980458) (not b!980457) (not b_lambda!14749))
(check-sat b_and!31511 (not b_next!19723))
