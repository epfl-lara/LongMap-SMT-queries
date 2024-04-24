; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84828 () Bool)

(assert start!84828)

(declare-fun b_free!20071 () Bool)

(declare-fun b_next!20071 () Bool)

(assert (=> start!84828 (= b_free!20071 (not b_next!20071))))

(declare-fun tp!70008 () Bool)

(declare-fun b_and!32223 () Bool)

(assert (=> start!84828 (= tp!70008 b_and!32223)))

(declare-fun b!990998 () Bool)

(declare-fun res!662416 () Bool)

(declare-fun e!558872 () Bool)

(assert (=> b!990998 (=> (not res!662416) (not e!558872))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62580 0))(
  ( (array!62581 (arr!30137 (Array (_ BitVec 32) (_ BitVec 64))) (size!30617 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62580)

(assert (=> b!990998 (= res!662416 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30617 _keys!1544))))))

(declare-fun b!990999 () Bool)

(declare-fun res!662410 () Bool)

(assert (=> b!990999 (=> (not res!662410) (not e!558872))))

(declare-datatypes ((List!20833 0))(
  ( (Nil!20830) (Cons!20829 (h!21997 (_ BitVec 64)) (t!29792 List!20833)) )
))
(declare-fun arrayNoDuplicates!0 (array!62580 (_ BitVec 32) List!20833) Bool)

(assert (=> b!990999 (= res!662410 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20830))))

(declare-fun b!991000 () Bool)

(declare-fun e!558868 () Bool)

(declare-fun e!558869 () Bool)

(declare-fun mapRes!36979 () Bool)

(assert (=> b!991000 (= e!558868 (and e!558869 mapRes!36979))))

(declare-fun condMapEmpty!36979 () Bool)

(declare-datatypes ((V!36033 0))(
  ( (V!36034 (val!11694 Int)) )
))
(declare-datatypes ((ValueCell!11162 0))(
  ( (ValueCellFull!11162 (v!14261 V!36033)) (EmptyCell!11162) )
))
(declare-datatypes ((array!62582 0))(
  ( (array!62583 (arr!30138 (Array (_ BitVec 32) ValueCell!11162)) (size!30618 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62582)

(declare-fun mapDefault!36979 () ValueCell!11162)

(assert (=> b!991000 (= condMapEmpty!36979 (= (arr!30138 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11162)) mapDefault!36979)))))

(declare-fun b!991002 () Bool)

(declare-fun res!662417 () Bool)

(assert (=> b!991002 (=> (not res!662417) (not e!558872))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62580 (_ BitVec 32)) Bool)

(assert (=> b!991002 (= res!662417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!991003 () Bool)

(declare-fun e!558870 () Bool)

(assert (=> b!991003 (= e!558870 (not (bvslt from!1932 (size!30618 _values!1278))))))

(declare-fun minValue!1220 () V!36033)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36033)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14926 0))(
  ( (tuple2!14927 (_1!7474 (_ BitVec 64)) (_2!7474 V!36033)) )
))
(declare-datatypes ((List!20834 0))(
  ( (Nil!20831) (Cons!20830 (h!21998 tuple2!14926) (t!29793 List!20834)) )
))
(declare-datatypes ((ListLongMap!13625 0))(
  ( (ListLongMap!13626 (toList!6828 List!20834)) )
))
(declare-fun lt!439581 () ListLongMap!13625)

(declare-fun getCurrentListMap!3875 (array!62580 array!62582 (_ BitVec 32) (_ BitVec 32) V!36033 V!36033 (_ BitVec 32) Int) ListLongMap!13625)

(assert (=> b!991003 (= lt!439581 (getCurrentListMap!3875 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439585 () ListLongMap!13625)

(declare-fun lt!439584 () tuple2!14926)

(declare-fun lt!439583 () tuple2!14926)

(declare-fun +!3116 (ListLongMap!13625 tuple2!14926) ListLongMap!13625)

(assert (=> b!991003 (= (+!3116 (+!3116 lt!439585 lt!439584) lt!439583) (+!3116 (+!3116 lt!439585 lt!439583) lt!439584))))

(declare-fun lt!439580 () V!36033)

(assert (=> b!991003 (= lt!439583 (tuple2!14927 (select (arr!30137 _keys!1544) from!1932) lt!439580))))

(assert (=> b!991003 (= lt!439584 (tuple2!14927 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32847 0))(
  ( (Unit!32848) )
))
(declare-fun lt!439582 () Unit!32847)

(declare-fun addCommutativeForDiffKeys!717 (ListLongMap!13625 (_ BitVec 64) V!36033 (_ BitVec 64) V!36033) Unit!32847)

(assert (=> b!991003 (= lt!439582 (addCommutativeForDiffKeys!717 lt!439585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30137 _keys!1544) from!1932) lt!439580))))

(declare-fun mapNonEmpty!36979 () Bool)

(declare-fun tp!70009 () Bool)

(declare-fun e!558873 () Bool)

(assert (=> mapNonEmpty!36979 (= mapRes!36979 (and tp!70009 e!558873))))

(declare-fun mapValue!36979 () ValueCell!11162)

(declare-fun mapKey!36979 () (_ BitVec 32))

(declare-fun mapRest!36979 () (Array (_ BitVec 32) ValueCell!11162))

(assert (=> mapNonEmpty!36979 (= (arr!30138 _values!1278) (store mapRest!36979 mapKey!36979 mapValue!36979))))

(declare-fun b!991004 () Bool)

(declare-fun res!662411 () Bool)

(assert (=> b!991004 (=> (not res!662411) (not e!558872))))

(assert (=> b!991004 (= res!662411 (and (= (size!30618 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30617 _keys!1544) (size!30618 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!991005 () Bool)

(declare-fun tp_is_empty!23287 () Bool)

(assert (=> b!991005 (= e!558869 tp_is_empty!23287)))

(declare-fun b!991006 () Bool)

(assert (=> b!991006 (= e!558872 e!558870)))

(declare-fun res!662415 () Bool)

(assert (=> b!991006 (=> (not res!662415) (not e!558870))))

(assert (=> b!991006 (= res!662415 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30137 _keys!1544) from!1932))))))

(declare-fun get!15669 (ValueCell!11162 V!36033) V!36033)

(declare-fun dynLambda!1900 (Int (_ BitVec 64)) V!36033)

(assert (=> b!991006 (= lt!439580 (get!15669 (select (arr!30138 _values!1278) from!1932) (dynLambda!1900 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3556 (array!62580 array!62582 (_ BitVec 32) (_ BitVec 32) V!36033 V!36033 (_ BitVec 32) Int) ListLongMap!13625)

(assert (=> b!991006 (= lt!439585 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36979 () Bool)

(assert (=> mapIsEmpty!36979 mapRes!36979))

(declare-fun b!991001 () Bool)

(declare-fun res!662412 () Bool)

(assert (=> b!991001 (=> (not res!662412) (not e!558872))))

(assert (=> b!991001 (= res!662412 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!662414 () Bool)

(assert (=> start!84828 (=> (not res!662414) (not e!558872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84828 (= res!662414 (validMask!0 mask!1948))))

(assert (=> start!84828 e!558872))

(assert (=> start!84828 true))

(assert (=> start!84828 tp_is_empty!23287))

(declare-fun array_inv!23305 (array!62582) Bool)

(assert (=> start!84828 (and (array_inv!23305 _values!1278) e!558868)))

(assert (=> start!84828 tp!70008))

(declare-fun array_inv!23306 (array!62580) Bool)

(assert (=> start!84828 (array_inv!23306 _keys!1544)))

(declare-fun b!991007 () Bool)

(declare-fun res!662413 () Bool)

(assert (=> b!991007 (=> (not res!662413) (not e!558872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991007 (= res!662413 (validKeyInArray!0 (select (arr!30137 _keys!1544) from!1932)))))

(declare-fun b!991008 () Bool)

(assert (=> b!991008 (= e!558873 tp_is_empty!23287)))

(assert (= (and start!84828 res!662414) b!991004))

(assert (= (and b!991004 res!662411) b!991002))

(assert (= (and b!991002 res!662417) b!990999))

(assert (= (and b!990999 res!662410) b!990998))

(assert (= (and b!990998 res!662416) b!991007))

(assert (= (and b!991007 res!662413) b!991001))

(assert (= (and b!991001 res!662412) b!991006))

(assert (= (and b!991006 res!662415) b!991003))

(assert (= (and b!991000 condMapEmpty!36979) mapIsEmpty!36979))

(assert (= (and b!991000 (not condMapEmpty!36979)) mapNonEmpty!36979))

(get-info :version)

(assert (= (and mapNonEmpty!36979 ((_ is ValueCellFull!11162) mapValue!36979)) b!991008))

(assert (= (and b!991000 ((_ is ValueCellFull!11162) mapDefault!36979)) b!991005))

(assert (= start!84828 b!991000))

(declare-fun b_lambda!15165 () Bool)

(assert (=> (not b_lambda!15165) (not b!991006)))

(declare-fun t!29791 () Bool)

(declare-fun tb!6809 () Bool)

(assert (=> (and start!84828 (= defaultEntry!1281 defaultEntry!1281) t!29791) tb!6809))

(declare-fun result!13627 () Bool)

(assert (=> tb!6809 (= result!13627 tp_is_empty!23287)))

(assert (=> b!991006 t!29791))

(declare-fun b_and!32225 () Bool)

(assert (= b_and!32223 (and (=> t!29791 result!13627) b_and!32225)))

(declare-fun m!918789 () Bool)

(assert (=> start!84828 m!918789))

(declare-fun m!918791 () Bool)

(assert (=> start!84828 m!918791))

(declare-fun m!918793 () Bool)

(assert (=> start!84828 m!918793))

(declare-fun m!918795 () Bool)

(assert (=> b!990999 m!918795))

(declare-fun m!918797 () Bool)

(assert (=> b!991002 m!918797))

(declare-fun m!918799 () Bool)

(assert (=> b!991007 m!918799))

(assert (=> b!991007 m!918799))

(declare-fun m!918801 () Bool)

(assert (=> b!991007 m!918801))

(assert (=> b!991006 m!918799))

(declare-fun m!918803 () Bool)

(assert (=> b!991006 m!918803))

(declare-fun m!918805 () Bool)

(assert (=> b!991006 m!918805))

(declare-fun m!918807 () Bool)

(assert (=> b!991006 m!918807))

(assert (=> b!991006 m!918803))

(assert (=> b!991006 m!918807))

(declare-fun m!918809 () Bool)

(assert (=> b!991006 m!918809))

(declare-fun m!918811 () Bool)

(assert (=> mapNonEmpty!36979 m!918811))

(assert (=> b!991003 m!918799))

(declare-fun m!918813 () Bool)

(assert (=> b!991003 m!918813))

(declare-fun m!918815 () Bool)

(assert (=> b!991003 m!918815))

(declare-fun m!918817 () Bool)

(assert (=> b!991003 m!918817))

(assert (=> b!991003 m!918815))

(declare-fun m!918819 () Bool)

(assert (=> b!991003 m!918819))

(declare-fun m!918821 () Bool)

(assert (=> b!991003 m!918821))

(assert (=> b!991003 m!918799))

(assert (=> b!991003 m!918821))

(declare-fun m!918823 () Bool)

(assert (=> b!991003 m!918823))

(check-sat (not start!84828) (not b!991002) (not b!991007) (not b!990999) (not b!991006) b_and!32225 (not b_next!20071) (not b_lambda!15165) tp_is_empty!23287 (not b!991003) (not mapNonEmpty!36979))
(check-sat b_and!32225 (not b_next!20071))
