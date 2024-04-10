; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84246 () Bool)

(assert start!84246)

(declare-fun b_free!19947 () Bool)

(declare-fun b_next!19947 () Bool)

(assert (=> start!84246 (= b_free!19947 (not b_next!19947))))

(declare-fun tp!69444 () Bool)

(declare-fun b_and!31971 () Bool)

(assert (=> start!84246 (= tp!69444 b_and!31971)))

(declare-fun b!985612 () Bool)

(declare-fun res!659538 () Bool)

(declare-fun e!555569 () Bool)

(assert (=> b!985612 (=> (not res!659538) (not e!555569))))

(declare-datatypes ((array!62073 0))(
  ( (array!62074 (arr!29894 (Array (_ BitVec 32) (_ BitVec 64))) (size!30373 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62073)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62073 (_ BitVec 32)) Bool)

(assert (=> b!985612 (= res!659538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985613 () Bool)

(declare-fun res!659537 () Bool)

(assert (=> b!985613 (=> (not res!659537) (not e!555569))))

(declare-datatypes ((V!35715 0))(
  ( (V!35716 (val!11575 Int)) )
))
(declare-datatypes ((ValueCell!11043 0))(
  ( (ValueCellFull!11043 (v!14137 V!35715)) (EmptyCell!11043) )
))
(declare-datatypes ((array!62075 0))(
  ( (array!62076 (arr!29895 (Array (_ BitVec 32) ValueCell!11043)) (size!30374 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62075)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985613 (= res!659537 (and (= (size!30374 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30373 _keys!1544) (size!30374 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985614 () Bool)

(declare-fun res!659536 () Bool)

(assert (=> b!985614 (=> (not res!659536) (not e!555569))))

(declare-datatypes ((List!20707 0))(
  ( (Nil!20704) (Cons!20703 (h!21865 (_ BitVec 64)) (t!29598 List!20707)) )
))
(declare-fun arrayNoDuplicates!0 (array!62073 (_ BitVec 32) List!20707) Bool)

(assert (=> b!985614 (= res!659536 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20704))))

(declare-fun res!659542 () Bool)

(assert (=> start!84246 (=> (not res!659542) (not e!555569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84246 (= res!659542 (validMask!0 mask!1948))))

(assert (=> start!84246 e!555569))

(assert (=> start!84246 true))

(declare-fun tp_is_empty!23049 () Bool)

(assert (=> start!84246 tp_is_empty!23049))

(declare-fun e!555568 () Bool)

(declare-fun array_inv!23107 (array!62075) Bool)

(assert (=> start!84246 (and (array_inv!23107 _values!1278) e!555568)))

(assert (=> start!84246 tp!69444))

(declare-fun array_inv!23108 (array!62073) Bool)

(assert (=> start!84246 (array_inv!23108 _keys!1544)))

(declare-fun b!985615 () Bool)

(declare-fun e!555565 () Bool)

(assert (=> b!985615 (= e!555565 tp_is_empty!23049)))

(declare-fun mapIsEmpty!36602 () Bool)

(declare-fun mapRes!36602 () Bool)

(assert (=> mapIsEmpty!36602 mapRes!36602))

(declare-fun b!985616 () Bool)

(declare-fun e!555567 () Bool)

(assert (=> b!985616 (= e!555569 e!555567)))

(declare-fun res!659543 () Bool)

(assert (=> b!985616 (=> (not res!659543) (not e!555567))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985616 (= res!659543 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29894 _keys!1544) from!1932))))))

(declare-fun lt!437321 () V!35715)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15520 (ValueCell!11043 V!35715) V!35715)

(declare-fun dynLambda!1843 (Int (_ BitVec 64)) V!35715)

(assert (=> b!985616 (= lt!437321 (get!15520 (select (arr!29895 _values!1278) from!1932) (dynLambda!1843 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35715)

(declare-fun zeroValue!1220 () V!35715)

(declare-datatypes ((tuple2!14816 0))(
  ( (tuple2!14817 (_1!7419 (_ BitVec 64)) (_2!7419 V!35715)) )
))
(declare-datatypes ((List!20708 0))(
  ( (Nil!20705) (Cons!20704 (h!21866 tuple2!14816) (t!29599 List!20708)) )
))
(declare-datatypes ((ListLongMap!13513 0))(
  ( (ListLongMap!13514 (toList!6772 List!20708)) )
))
(declare-fun lt!437319 () ListLongMap!13513)

(declare-fun getCurrentListMapNoExtraKeys!3463 (array!62073 array!62075 (_ BitVec 32) (_ BitVec 32) V!35715 V!35715 (_ BitVec 32) Int) ListLongMap!13513)

(assert (=> b!985616 (= lt!437319 (getCurrentListMapNoExtraKeys!3463 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985617 () Bool)

(declare-fun res!659541 () Bool)

(assert (=> b!985617 (=> (not res!659541) (not e!555569))))

(assert (=> b!985617 (= res!659541 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30373 _keys!1544))))))

(declare-fun b!985618 () Bool)

(declare-fun res!659539 () Bool)

(assert (=> b!985618 (=> (not res!659539) (not e!555569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985618 (= res!659539 (validKeyInArray!0 (select (arr!29894 _keys!1544) from!1932)))))

(declare-fun b!985619 () Bool)

(declare-fun e!555570 () Bool)

(assert (=> b!985619 (= e!555570 tp_is_empty!23049)))

(declare-fun b!985620 () Bool)

(assert (=> b!985620 (= e!555568 (and e!555570 mapRes!36602))))

(declare-fun condMapEmpty!36602 () Bool)

(declare-fun mapDefault!36602 () ValueCell!11043)

(assert (=> b!985620 (= condMapEmpty!36602 (= (arr!29895 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11043)) mapDefault!36602)))))

(declare-fun b!985621 () Bool)

(declare-fun res!659540 () Bool)

(assert (=> b!985621 (=> (not res!659540) (not e!555569))))

(assert (=> b!985621 (= res!659540 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36602 () Bool)

(declare-fun tp!69445 () Bool)

(assert (=> mapNonEmpty!36602 (= mapRes!36602 (and tp!69445 e!555565))))

(declare-fun mapRest!36602 () (Array (_ BitVec 32) ValueCell!11043))

(declare-fun mapKey!36602 () (_ BitVec 32))

(declare-fun mapValue!36602 () ValueCell!11043)

(assert (=> mapNonEmpty!36602 (= (arr!29895 _values!1278) (store mapRest!36602 mapKey!36602 mapValue!36602))))

(declare-fun b!985622 () Bool)

(assert (=> b!985622 (= e!555567 (not true))))

(declare-fun lt!437320 () tuple2!14816)

(declare-fun lt!437317 () tuple2!14816)

(declare-fun +!3058 (ListLongMap!13513 tuple2!14816) ListLongMap!13513)

(assert (=> b!985622 (= (+!3058 (+!3058 lt!437319 lt!437320) lt!437317) (+!3058 (+!3058 lt!437319 lt!437317) lt!437320))))

(assert (=> b!985622 (= lt!437317 (tuple2!14817 (select (arr!29894 _keys!1544) from!1932) lt!437321))))

(assert (=> b!985622 (= lt!437320 (tuple2!14817 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32755 0))(
  ( (Unit!32756) )
))
(declare-fun lt!437318 () Unit!32755)

(declare-fun addCommutativeForDiffKeys!686 (ListLongMap!13513 (_ BitVec 64) V!35715 (_ BitVec 64) V!35715) Unit!32755)

(assert (=> b!985622 (= lt!437318 (addCommutativeForDiffKeys!686 lt!437319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29894 _keys!1544) from!1932) lt!437321))))

(assert (= (and start!84246 res!659542) b!985613))

(assert (= (and b!985613 res!659537) b!985612))

(assert (= (and b!985612 res!659538) b!985614))

(assert (= (and b!985614 res!659536) b!985617))

(assert (= (and b!985617 res!659541) b!985618))

(assert (= (and b!985618 res!659539) b!985621))

(assert (= (and b!985621 res!659540) b!985616))

(assert (= (and b!985616 res!659543) b!985622))

(assert (= (and b!985620 condMapEmpty!36602) mapIsEmpty!36602))

(assert (= (and b!985620 (not condMapEmpty!36602)) mapNonEmpty!36602))

(get-info :version)

(assert (= (and mapNonEmpty!36602 ((_ is ValueCellFull!11043) mapValue!36602)) b!985615))

(assert (= (and b!985620 ((_ is ValueCellFull!11043) mapDefault!36602)) b!985619))

(assert (= start!84246 b!985620))

(declare-fun b_lambda!14979 () Bool)

(assert (=> (not b_lambda!14979) (not b!985616)))

(declare-fun t!29597 () Bool)

(declare-fun tb!6741 () Bool)

(assert (=> (and start!84246 (= defaultEntry!1281 defaultEntry!1281) t!29597) tb!6741))

(declare-fun result!13471 () Bool)

(assert (=> tb!6741 (= result!13471 tp_is_empty!23049)))

(assert (=> b!985616 t!29597))

(declare-fun b_and!31973 () Bool)

(assert (= b_and!31971 (and (=> t!29597 result!13471) b_and!31973)))

(declare-fun m!912665 () Bool)

(assert (=> start!84246 m!912665))

(declare-fun m!912667 () Bool)

(assert (=> start!84246 m!912667))

(declare-fun m!912669 () Bool)

(assert (=> start!84246 m!912669))

(declare-fun m!912671 () Bool)

(assert (=> mapNonEmpty!36602 m!912671))

(declare-fun m!912673 () Bool)

(assert (=> b!985618 m!912673))

(assert (=> b!985618 m!912673))

(declare-fun m!912675 () Bool)

(assert (=> b!985618 m!912675))

(assert (=> b!985616 m!912673))

(declare-fun m!912677 () Bool)

(assert (=> b!985616 m!912677))

(declare-fun m!912679 () Bool)

(assert (=> b!985616 m!912679))

(declare-fun m!912681 () Bool)

(assert (=> b!985616 m!912681))

(assert (=> b!985616 m!912677))

(assert (=> b!985616 m!912681))

(declare-fun m!912683 () Bool)

(assert (=> b!985616 m!912683))

(declare-fun m!912685 () Bool)

(assert (=> b!985612 m!912685))

(declare-fun m!912687 () Bool)

(assert (=> b!985614 m!912687))

(assert (=> b!985622 m!912673))

(declare-fun m!912689 () Bool)

(assert (=> b!985622 m!912689))

(declare-fun m!912691 () Bool)

(assert (=> b!985622 m!912691))

(assert (=> b!985622 m!912673))

(declare-fun m!912693 () Bool)

(assert (=> b!985622 m!912693))

(declare-fun m!912695 () Bool)

(assert (=> b!985622 m!912695))

(declare-fun m!912697 () Bool)

(assert (=> b!985622 m!912697))

(assert (=> b!985622 m!912695))

(assert (=> b!985622 m!912689))

(check-sat (not b!985612) b_and!31973 tp_is_empty!23049 (not b!985622) (not b_lambda!14979) (not mapNonEmpty!36602) (not start!84246) (not b!985616) (not b!985614) (not b_next!19947) (not b!985618))
(check-sat b_and!31973 (not b_next!19947))
