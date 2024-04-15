; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83800 () Bool)

(assert start!83800)

(declare-fun b_free!19627 () Bool)

(declare-fun b_next!19627 () Bool)

(assert (=> start!83800 (= b_free!19627 (not b_next!19627))))

(declare-fun tp!68324 () Bool)

(declare-fun b_and!31317 () Bool)

(assert (=> start!83800 (= tp!68324 b_and!31317)))

(declare-fun b!978777 () Bool)

(declare-fun res!655064 () Bool)

(declare-fun e!551747 () Bool)

(assert (=> b!978777 (=> (not res!655064) (not e!551747))))

(declare-datatypes ((array!61188 0))(
  ( (array!61189 (arr!29452 (Array (_ BitVec 32) (_ BitVec 64))) (size!29933 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61188)

(declare-datatypes ((List!20458 0))(
  ( (Nil!20455) (Cons!20454 (h!21616 (_ BitVec 64)) (t!29032 List!20458)) )
))
(declare-fun arrayNoDuplicates!0 (array!61188 (_ BitVec 32) List!20458) Bool)

(assert (=> b!978777 (= res!655064 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20455))))

(declare-fun b!978778 () Bool)

(declare-fun res!655070 () Bool)

(assert (=> b!978778 (=> (not res!655070) (not e!551747))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978778 (= res!655070 (validKeyInArray!0 (select (arr!29452 _keys!1544) from!1932)))))

(declare-fun b!978779 () Bool)

(declare-fun res!655067 () Bool)

(assert (=> b!978779 (=> (not res!655067) (not e!551747))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978779 (= res!655067 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978780 () Bool)

(declare-fun e!551746 () Bool)

(declare-fun tp_is_empty!22621 () Bool)

(assert (=> b!978780 (= e!551746 tp_is_empty!22621)))

(declare-fun b!978781 () Bool)

(declare-fun res!655071 () Bool)

(assert (=> b!978781 (=> (not res!655071) (not e!551747))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61188 (_ BitVec 32)) Bool)

(assert (=> b!978781 (= res!655071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35960 () Bool)

(declare-fun mapRes!35960 () Bool)

(declare-fun tp!68323 () Bool)

(assert (=> mapNonEmpty!35960 (= mapRes!35960 (and tp!68323 e!551746))))

(declare-datatypes ((V!35145 0))(
  ( (V!35146 (val!11361 Int)) )
))
(declare-datatypes ((ValueCell!10829 0))(
  ( (ValueCellFull!10829 (v!13922 V!35145)) (EmptyCell!10829) )
))
(declare-datatypes ((array!61190 0))(
  ( (array!61191 (arr!29453 (Array (_ BitVec 32) ValueCell!10829)) (size!29934 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61190)

(declare-fun mapValue!35960 () ValueCell!10829)

(declare-fun mapRest!35960 () (Array (_ BitVec 32) ValueCell!10829))

(declare-fun mapKey!35960 () (_ BitVec 32))

(assert (=> mapNonEmpty!35960 (= (arr!29453 _values!1278) (store mapRest!35960 mapKey!35960 mapValue!35960))))

(declare-fun b!978782 () Bool)

(declare-fun e!551745 () Bool)

(assert (=> b!978782 (= e!551745 tp_is_empty!22621)))

(declare-fun b!978784 () Bool)

(declare-fun e!551750 () Bool)

(assert (=> b!978784 (= e!551747 (not e!551750))))

(declare-fun res!655069 () Bool)

(assert (=> b!978784 (=> res!655069 e!551750)))

(assert (=> b!978784 (= res!655069 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29452 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14632 0))(
  ( (tuple2!14633 (_1!7327 (_ BitVec 64)) (_2!7327 V!35145)) )
))
(declare-datatypes ((List!20459 0))(
  ( (Nil!20456) (Cons!20455 (h!21617 tuple2!14632) (t!29033 List!20459)) )
))
(declare-datatypes ((ListLongMap!13319 0))(
  ( (ListLongMap!13320 (toList!6675 List!20459)) )
))
(declare-fun lt!433860 () ListLongMap!13319)

(declare-fun lt!433858 () ListLongMap!13319)

(declare-fun lt!433863 () tuple2!14632)

(declare-fun lt!433855 () tuple2!14632)

(declare-fun +!2975 (ListLongMap!13319 tuple2!14632) ListLongMap!13319)

(assert (=> b!978784 (= (+!2975 lt!433858 lt!433855) (+!2975 lt!433860 lt!433863))))

(declare-fun lt!433854 () ListLongMap!13319)

(assert (=> b!978784 (= lt!433860 (+!2975 lt!433854 lt!433855))))

(declare-fun lt!433862 () V!35145)

(assert (=> b!978784 (= lt!433855 (tuple2!14633 (select (arr!29452 _keys!1544) from!1932) lt!433862))))

(assert (=> b!978784 (= lt!433858 (+!2975 lt!433854 lt!433863))))

(declare-fun minValue!1220 () V!35145)

(assert (=> b!978784 (= lt!433863 (tuple2!14633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32416 0))(
  ( (Unit!32417) )
))
(declare-fun lt!433859 () Unit!32416)

(declare-fun addCommutativeForDiffKeys!579 (ListLongMap!13319 (_ BitVec 64) V!35145 (_ BitVec 64) V!35145) Unit!32416)

(assert (=> b!978784 (= lt!433859 (addCommutativeForDiffKeys!579 lt!433854 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29452 _keys!1544) from!1932) lt!433862))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15268 (ValueCell!10829 V!35145) V!35145)

(declare-fun dynLambda!1728 (Int (_ BitVec 64)) V!35145)

(assert (=> b!978784 (= lt!433862 (get!15268 (select (arr!29453 _values!1278) from!1932) (dynLambda!1728 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433856 () ListLongMap!13319)

(declare-fun lt!433861 () tuple2!14632)

(assert (=> b!978784 (= lt!433854 (+!2975 lt!433856 lt!433861))))

(declare-fun zeroValue!1220 () V!35145)

(assert (=> b!978784 (= lt!433861 (tuple2!14633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3395 (array!61188 array!61190 (_ BitVec 32) (_ BitVec 32) V!35145 V!35145 (_ BitVec 32) Int) ListLongMap!13319)

(assert (=> b!978784 (= lt!433856 (getCurrentListMapNoExtraKeys!3395 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!978785 () Bool)

(declare-fun res!655065 () Bool)

(assert (=> b!978785 (=> (not res!655065) (not e!551747))))

(assert (=> b!978785 (= res!655065 (and (= (size!29934 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29933 _keys!1544) (size!29934 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!655068 () Bool)

(assert (=> start!83800 (=> (not res!655068) (not e!551747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83800 (= res!655068 (validMask!0 mask!1948))))

(assert (=> start!83800 e!551747))

(assert (=> start!83800 true))

(assert (=> start!83800 tp_is_empty!22621))

(declare-fun e!551748 () Bool)

(declare-fun array_inv!22807 (array!61190) Bool)

(assert (=> start!83800 (and (array_inv!22807 _values!1278) e!551748)))

(assert (=> start!83800 tp!68324))

(declare-fun array_inv!22808 (array!61188) Bool)

(assert (=> start!83800 (array_inv!22808 _keys!1544)))

(declare-fun b!978783 () Bool)

(assert (=> b!978783 (= e!551750 true)))

(assert (=> b!978783 (= lt!433860 (+!2975 (+!2975 lt!433856 lt!433855) lt!433861))))

(declare-fun lt!433857 () Unit!32416)

(assert (=> b!978783 (= lt!433857 (addCommutativeForDiffKeys!579 lt!433856 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29452 _keys!1544) from!1932) lt!433862))))

(declare-fun b!978786 () Bool)

(assert (=> b!978786 (= e!551748 (and e!551745 mapRes!35960))))

(declare-fun condMapEmpty!35960 () Bool)

(declare-fun mapDefault!35960 () ValueCell!10829)

(assert (=> b!978786 (= condMapEmpty!35960 (= (arr!29453 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10829)) mapDefault!35960)))))

(declare-fun b!978787 () Bool)

(declare-fun res!655066 () Bool)

(assert (=> b!978787 (=> (not res!655066) (not e!551747))))

(assert (=> b!978787 (= res!655066 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29933 _keys!1544))))))

(declare-fun mapIsEmpty!35960 () Bool)

(assert (=> mapIsEmpty!35960 mapRes!35960))

(assert (= (and start!83800 res!655068) b!978785))

(assert (= (and b!978785 res!655065) b!978781))

(assert (= (and b!978781 res!655071) b!978777))

(assert (= (and b!978777 res!655064) b!978787))

(assert (= (and b!978787 res!655066) b!978778))

(assert (= (and b!978778 res!655070) b!978779))

(assert (= (and b!978779 res!655067) b!978784))

(assert (= (and b!978784 (not res!655069)) b!978783))

(assert (= (and b!978786 condMapEmpty!35960) mapIsEmpty!35960))

(assert (= (and b!978786 (not condMapEmpty!35960)) mapNonEmpty!35960))

(get-info :version)

(assert (= (and mapNonEmpty!35960 ((_ is ValueCellFull!10829) mapValue!35960)) b!978780))

(assert (= (and b!978786 ((_ is ValueCellFull!10829) mapDefault!35960)) b!978782))

(assert (= start!83800 b!978786))

(declare-fun b_lambda!14653 () Bool)

(assert (=> (not b_lambda!14653) (not b!978784)))

(declare-fun t!29031 () Bool)

(declare-fun tb!6425 () Bool)

(assert (=> (and start!83800 (= defaultEntry!1281 defaultEntry!1281) t!29031) tb!6425))

(declare-fun result!12847 () Bool)

(assert (=> tb!6425 (= result!12847 tp_is_empty!22621)))

(assert (=> b!978784 t!29031))

(declare-fun b_and!31319 () Bool)

(assert (= b_and!31317 (and (=> t!29031 result!12847) b_and!31319)))

(declare-fun m!905483 () Bool)

(assert (=> b!978781 m!905483))

(declare-fun m!905485 () Bool)

(assert (=> b!978778 m!905485))

(assert (=> b!978778 m!905485))

(declare-fun m!905487 () Bool)

(assert (=> b!978778 m!905487))

(declare-fun m!905489 () Bool)

(assert (=> mapNonEmpty!35960 m!905489))

(declare-fun m!905491 () Bool)

(assert (=> b!978783 m!905491))

(assert (=> b!978783 m!905491))

(declare-fun m!905493 () Bool)

(assert (=> b!978783 m!905493))

(assert (=> b!978783 m!905485))

(assert (=> b!978783 m!905485))

(declare-fun m!905495 () Bool)

(assert (=> b!978783 m!905495))

(declare-fun m!905497 () Bool)

(assert (=> b!978777 m!905497))

(declare-fun m!905499 () Bool)

(assert (=> b!978784 m!905499))

(assert (=> b!978784 m!905485))

(declare-fun m!905501 () Bool)

(assert (=> b!978784 m!905501))

(declare-fun m!905503 () Bool)

(assert (=> b!978784 m!905503))

(assert (=> b!978784 m!905485))

(declare-fun m!905505 () Bool)

(assert (=> b!978784 m!905505))

(declare-fun m!905507 () Bool)

(assert (=> b!978784 m!905507))

(declare-fun m!905509 () Bool)

(assert (=> b!978784 m!905509))

(declare-fun m!905511 () Bool)

(assert (=> b!978784 m!905511))

(declare-fun m!905513 () Bool)

(assert (=> b!978784 m!905513))

(declare-fun m!905515 () Bool)

(assert (=> b!978784 m!905515))

(assert (=> b!978784 m!905501))

(assert (=> b!978784 m!905515))

(declare-fun m!905517 () Bool)

(assert (=> b!978784 m!905517))

(declare-fun m!905519 () Bool)

(assert (=> start!83800 m!905519))

(declare-fun m!905521 () Bool)

(assert (=> start!83800 m!905521))

(declare-fun m!905523 () Bool)

(assert (=> start!83800 m!905523))

(check-sat b_and!31319 (not b!978784) (not b!978783) (not b!978781) tp_is_empty!22621 (not b_next!19627) (not b_lambda!14653) (not mapNonEmpty!35960) (not b!978777) (not start!83800) (not b!978778))
(check-sat b_and!31319 (not b_next!19627))
