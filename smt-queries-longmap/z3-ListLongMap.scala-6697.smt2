; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84322 () Bool)

(assert start!84322)

(declare-fun b_free!19855 () Bool)

(declare-fun b_next!19855 () Bool)

(assert (=> start!84322 (= b_free!19855 (not b_next!19855))))

(declare-fun tp!69169 () Bool)

(declare-fun b_and!31797 () Bool)

(assert (=> start!84322 (= tp!69169 b_and!31797)))

(declare-fun b!984905 () Bool)

(declare-fun res!658776 () Bool)

(declare-fun e!555322 () Bool)

(assert (=> b!984905 (=> (not res!658776) (not e!555322))))

(declare-datatypes ((array!61934 0))(
  ( (array!61935 (arr!29820 (Array (_ BitVec 32) (_ BitVec 64))) (size!30300 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61934)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61934 (_ BitVec 32)) Bool)

(assert (=> b!984905 (= res!658776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984906 () Bool)

(declare-fun e!555321 () Bool)

(declare-fun tp_is_empty!22957 () Bool)

(assert (=> b!984906 (= e!555321 tp_is_empty!22957)))

(declare-fun mapNonEmpty!36464 () Bool)

(declare-fun mapRes!36464 () Bool)

(declare-fun tp!69170 () Bool)

(assert (=> mapNonEmpty!36464 (= mapRes!36464 (and tp!69170 e!555321))))

(declare-datatypes ((V!35593 0))(
  ( (V!35594 (val!11529 Int)) )
))
(declare-datatypes ((ValueCell!10997 0))(
  ( (ValueCellFull!10997 (v!14088 V!35593)) (EmptyCell!10997) )
))
(declare-datatypes ((array!61936 0))(
  ( (array!61937 (arr!29821 (Array (_ BitVec 32) ValueCell!10997)) (size!30301 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61936)

(declare-fun mapRest!36464 () (Array (_ BitVec 32) ValueCell!10997))

(declare-fun mapKey!36464 () (_ BitVec 32))

(declare-fun mapValue!36464 () ValueCell!10997)

(assert (=> mapNonEmpty!36464 (= (arr!29821 _values!1278) (store mapRest!36464 mapKey!36464 mapValue!36464))))

(declare-fun b!984907 () Bool)

(declare-fun res!658782 () Bool)

(assert (=> b!984907 (=> (not res!658782) (not e!555322))))

(declare-datatypes ((List!20646 0))(
  ( (Nil!20643) (Cons!20642 (h!21810 (_ BitVec 64)) (t!29437 List!20646)) )
))
(declare-fun arrayNoDuplicates!0 (array!61934 (_ BitVec 32) List!20646) Bool)

(assert (=> b!984907 (= res!658782 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20643))))

(declare-fun b!984908 () Bool)

(declare-fun e!555324 () Bool)

(declare-fun e!555323 () Bool)

(assert (=> b!984908 (= e!555324 (and e!555323 mapRes!36464))))

(declare-fun condMapEmpty!36464 () Bool)

(declare-fun mapDefault!36464 () ValueCell!10997)

(assert (=> b!984908 (= condMapEmpty!36464 (= (arr!29821 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10997)) mapDefault!36464)))))

(declare-fun b!984909 () Bool)

(declare-fun res!658778 () Bool)

(assert (=> b!984909 (=> (not res!658778) (not e!555322))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984909 (= res!658778 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984910 () Bool)

(declare-fun e!555320 () Bool)

(assert (=> b!984910 (= e!555320 (not true))))

(declare-datatypes ((tuple2!14762 0))(
  ( (tuple2!14763 (_1!7392 (_ BitVec 64)) (_2!7392 V!35593)) )
))
(declare-datatypes ((List!20647 0))(
  ( (Nil!20644) (Cons!20643 (h!21811 tuple2!14762) (t!29438 List!20647)) )
))
(declare-datatypes ((ListLongMap!13461 0))(
  ( (ListLongMap!13462 (toList!6746 List!20647)) )
))
(declare-fun lt!436990 () ListLongMap!13461)

(declare-fun lt!436992 () tuple2!14762)

(declare-fun lt!436988 () tuple2!14762)

(declare-fun +!3050 (ListLongMap!13461 tuple2!14762) ListLongMap!13461)

(assert (=> b!984910 (= (+!3050 (+!3050 lt!436990 lt!436992) lt!436988) (+!3050 (+!3050 lt!436990 lt!436988) lt!436992))))

(declare-fun lt!436989 () V!35593)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984910 (= lt!436988 (tuple2!14763 (select (arr!29820 _keys!1544) from!1932) lt!436989))))

(declare-fun minValue!1220 () V!35593)

(assert (=> b!984910 (= lt!436992 (tuple2!14763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32680 0))(
  ( (Unit!32681) )
))
(declare-fun lt!436991 () Unit!32680)

(declare-fun addCommutativeForDiffKeys!657 (ListLongMap!13461 (_ BitVec 64) V!35593 (_ BitVec 64) V!35593) Unit!32680)

(assert (=> b!984910 (= lt!436991 (addCommutativeForDiffKeys!657 lt!436990 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29820 _keys!1544) from!1932) lt!436989))))

(declare-fun mapIsEmpty!36464 () Bool)

(assert (=> mapIsEmpty!36464 mapRes!36464))

(declare-fun b!984911 () Bool)

(declare-fun res!658781 () Bool)

(assert (=> b!984911 (=> (not res!658781) (not e!555322))))

(assert (=> b!984911 (= res!658781 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30300 _keys!1544))))))

(declare-fun b!984912 () Bool)

(declare-fun res!658777 () Bool)

(assert (=> b!984912 (=> (not res!658777) (not e!555322))))

(assert (=> b!984912 (= res!658777 (and (= (size!30301 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30300 _keys!1544) (size!30301 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984913 () Bool)

(declare-fun res!658779 () Bool)

(assert (=> b!984913 (=> (not res!658779) (not e!555322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984913 (= res!658779 (validKeyInArray!0 (select (arr!29820 _keys!1544) from!1932)))))

(declare-fun b!984914 () Bool)

(assert (=> b!984914 (= e!555323 tp_is_empty!22957)))

(declare-fun res!658780 () Bool)

(assert (=> start!84322 (=> (not res!658780) (not e!555322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84322 (= res!658780 (validMask!0 mask!1948))))

(assert (=> start!84322 e!555322))

(assert (=> start!84322 true))

(assert (=> start!84322 tp_is_empty!22957))

(declare-fun array_inv!23071 (array!61936) Bool)

(assert (=> start!84322 (and (array_inv!23071 _values!1278) e!555324)))

(assert (=> start!84322 tp!69169))

(declare-fun array_inv!23072 (array!61934) Bool)

(assert (=> start!84322 (array_inv!23072 _keys!1544)))

(declare-fun b!984915 () Bool)

(assert (=> b!984915 (= e!555322 e!555320)))

(declare-fun res!658783 () Bool)

(assert (=> b!984915 (=> (not res!658783) (not e!555320))))

(assert (=> b!984915 (= res!658783 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29820 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15491 (ValueCell!10997 V!35593) V!35593)

(declare-fun dynLambda!1840 (Int (_ BitVec 64)) V!35593)

(assert (=> b!984915 (= lt!436989 (get!15491 (select (arr!29821 _values!1278) from!1932) (dynLambda!1840 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35593)

(declare-fun getCurrentListMapNoExtraKeys!3483 (array!61934 array!61936 (_ BitVec 32) (_ BitVec 32) V!35593 V!35593 (_ BitVec 32) Int) ListLongMap!13461)

(assert (=> b!984915 (= lt!436990 (getCurrentListMapNoExtraKeys!3483 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84322 res!658780) b!984912))

(assert (= (and b!984912 res!658777) b!984905))

(assert (= (and b!984905 res!658776) b!984907))

(assert (= (and b!984907 res!658782) b!984911))

(assert (= (and b!984911 res!658781) b!984913))

(assert (= (and b!984913 res!658779) b!984909))

(assert (= (and b!984909 res!658778) b!984915))

(assert (= (and b!984915 res!658783) b!984910))

(assert (= (and b!984908 condMapEmpty!36464) mapIsEmpty!36464))

(assert (= (and b!984908 (not condMapEmpty!36464)) mapNonEmpty!36464))

(get-info :version)

(assert (= (and mapNonEmpty!36464 ((_ is ValueCellFull!10997) mapValue!36464)) b!984906))

(assert (= (and b!984908 ((_ is ValueCellFull!10997) mapDefault!36464)) b!984914))

(assert (= start!84322 b!984908))

(declare-fun b_lambda!14901 () Bool)

(assert (=> (not b_lambda!14901) (not b!984915)))

(declare-fun t!29436 () Bool)

(declare-fun tb!6641 () Bool)

(assert (=> (and start!84322 (= defaultEntry!1281 defaultEntry!1281) t!29436) tb!6641))

(declare-fun result!13279 () Bool)

(assert (=> tb!6641 (= result!13279 tp_is_empty!22957)))

(assert (=> b!984915 t!29436))

(declare-fun b_and!31799 () Bool)

(assert (= b_and!31797 (and (=> t!29436 result!13279) b_and!31799)))

(declare-fun m!912395 () Bool)

(assert (=> b!984905 m!912395))

(declare-fun m!912397 () Bool)

(assert (=> start!84322 m!912397))

(declare-fun m!912399 () Bool)

(assert (=> start!84322 m!912399))

(declare-fun m!912401 () Bool)

(assert (=> start!84322 m!912401))

(declare-fun m!912403 () Bool)

(assert (=> b!984910 m!912403))

(declare-fun m!912405 () Bool)

(assert (=> b!984910 m!912405))

(assert (=> b!984910 m!912405))

(declare-fun m!912407 () Bool)

(assert (=> b!984910 m!912407))

(assert (=> b!984910 m!912403))

(declare-fun m!912409 () Bool)

(assert (=> b!984910 m!912409))

(declare-fun m!912411 () Bool)

(assert (=> b!984910 m!912411))

(declare-fun m!912413 () Bool)

(assert (=> b!984910 m!912413))

(assert (=> b!984910 m!912411))

(declare-fun m!912415 () Bool)

(assert (=> mapNonEmpty!36464 m!912415))

(assert (=> b!984913 m!912403))

(assert (=> b!984913 m!912403))

(declare-fun m!912417 () Bool)

(assert (=> b!984913 m!912417))

(declare-fun m!912419 () Bool)

(assert (=> b!984907 m!912419))

(assert (=> b!984915 m!912403))

(declare-fun m!912421 () Bool)

(assert (=> b!984915 m!912421))

(declare-fun m!912423 () Bool)

(assert (=> b!984915 m!912423))

(declare-fun m!912425 () Bool)

(assert (=> b!984915 m!912425))

(assert (=> b!984915 m!912421))

(assert (=> b!984915 m!912425))

(declare-fun m!912427 () Bool)

(assert (=> b!984915 m!912427))

(check-sat (not mapNonEmpty!36464) tp_is_empty!22957 (not b!984915) (not b_lambda!14901) (not start!84322) (not b!984907) (not b!984913) (not b!984905) (not b_next!19855) b_and!31799 (not b!984910))
(check-sat b_and!31799 (not b_next!19855))
