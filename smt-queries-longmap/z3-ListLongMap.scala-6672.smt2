; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84172 () Bool)

(assert start!84172)

(declare-fun b_free!19759 () Bool)

(declare-fun b_next!19759 () Bool)

(assert (=> start!84172 (= b_free!19759 (not b_next!19759))))

(declare-fun tp!68800 () Bool)

(declare-fun b_and!31611 () Bool)

(assert (=> start!84172 (= tp!68800 b_and!31611)))

(declare-fun b!982727 () Bool)

(declare-fun res!657369 () Bool)

(declare-fun e!554062 () Bool)

(assert (=> b!982727 (=> (not res!657369) (not e!554062))))

(declare-datatypes ((array!61646 0))(
  ( (array!61647 (arr!29676 (Array (_ BitVec 32) (_ BitVec 64))) (size!30156 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61646)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982727 (= res!657369 (validKeyInArray!0 (select (arr!29676 _keys!1544) from!1932)))))

(declare-fun b!982728 () Bool)

(declare-fun res!657364 () Bool)

(assert (=> b!982728 (=> (not res!657364) (not e!554062))))

(assert (=> b!982728 (= res!657364 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30156 _keys!1544))))))

(declare-fun b!982729 () Bool)

(declare-fun e!554063 () Bool)

(declare-fun tp_is_empty!22807 () Bool)

(assert (=> b!982729 (= e!554063 tp_is_empty!22807)))

(declare-fun mapNonEmpty!36239 () Bool)

(declare-fun mapRes!36239 () Bool)

(declare-fun tp!68801 () Bool)

(declare-fun e!554064 () Bool)

(assert (=> mapNonEmpty!36239 (= mapRes!36239 (and tp!68801 e!554064))))

(declare-datatypes ((V!35393 0))(
  ( (V!35394 (val!11454 Int)) )
))
(declare-datatypes ((ValueCell!10922 0))(
  ( (ValueCellFull!10922 (v!14013 V!35393)) (EmptyCell!10922) )
))
(declare-datatypes ((array!61648 0))(
  ( (array!61649 (arr!29677 (Array (_ BitVec 32) ValueCell!10922)) (size!30157 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61648)

(declare-fun mapKey!36239 () (_ BitVec 32))

(declare-fun mapValue!36239 () ValueCell!10922)

(declare-fun mapRest!36239 () (Array (_ BitVec 32) ValueCell!10922))

(assert (=> mapNonEmpty!36239 (= (arr!29677 _values!1278) (store mapRest!36239 mapKey!36239 mapValue!36239))))

(declare-fun b!982730 () Bool)

(declare-fun res!657370 () Bool)

(assert (=> b!982730 (=> (not res!657370) (not e!554062))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61646 (_ BitVec 32)) Bool)

(assert (=> b!982730 (= res!657370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982731 () Bool)

(declare-fun e!554061 () Bool)

(assert (=> b!982731 (= e!554061 (not true))))

(declare-datatypes ((tuple2!14680 0))(
  ( (tuple2!14681 (_1!7351 (_ BitVec 64)) (_2!7351 V!35393)) )
))
(declare-datatypes ((List!20557 0))(
  ( (Nil!20554) (Cons!20553 (h!21721 tuple2!14680) (t!29258 List!20557)) )
))
(declare-datatypes ((ListLongMap!13379 0))(
  ( (ListLongMap!13380 (toList!6705 List!20557)) )
))
(declare-fun lt!436232 () ListLongMap!13379)

(declare-fun lt!436234 () tuple2!14680)

(declare-fun lt!436233 () tuple2!14680)

(declare-fun +!3015 (ListLongMap!13379 tuple2!14680) ListLongMap!13379)

(assert (=> b!982731 (= (+!3015 (+!3015 lt!436232 lt!436234) lt!436233) (+!3015 (+!3015 lt!436232 lt!436233) lt!436234))))

(declare-fun lt!436236 () V!35393)

(assert (=> b!982731 (= lt!436233 (tuple2!14681 (select (arr!29676 _keys!1544) from!1932) lt!436236))))

(declare-fun zeroValue!1220 () V!35393)

(assert (=> b!982731 (= lt!436234 (tuple2!14681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32610 0))(
  ( (Unit!32611) )
))
(declare-fun lt!436235 () Unit!32610)

(declare-fun addCommutativeForDiffKeys!622 (ListLongMap!13379 (_ BitVec 64) V!35393 (_ BitVec 64) V!35393) Unit!32610)

(assert (=> b!982731 (= lt!436235 (addCommutativeForDiffKeys!622 lt!436232 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29676 _keys!1544) from!1932) lt!436236))))

(declare-fun res!657363 () Bool)

(assert (=> start!84172 (=> (not res!657363) (not e!554062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84172 (= res!657363 (validMask!0 mask!1948))))

(assert (=> start!84172 e!554062))

(assert (=> start!84172 true))

(assert (=> start!84172 tp_is_empty!22807))

(declare-fun e!554059 () Bool)

(declare-fun array_inv!22965 (array!61648) Bool)

(assert (=> start!84172 (and (array_inv!22965 _values!1278) e!554059)))

(assert (=> start!84172 tp!68800))

(declare-fun array_inv!22966 (array!61646) Bool)

(assert (=> start!84172 (array_inv!22966 _keys!1544)))

(declare-fun b!982732 () Bool)

(declare-fun res!657367 () Bool)

(assert (=> b!982732 (=> (not res!657367) (not e!554062))))

(declare-datatypes ((List!20558 0))(
  ( (Nil!20555) (Cons!20554 (h!21722 (_ BitVec 64)) (t!29259 List!20558)) )
))
(declare-fun arrayNoDuplicates!0 (array!61646 (_ BitVec 32) List!20558) Bool)

(assert (=> b!982732 (= res!657367 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20555))))

(declare-fun b!982733 () Bool)

(assert (=> b!982733 (= e!554062 e!554061)))

(declare-fun res!657365 () Bool)

(assert (=> b!982733 (=> (not res!657365) (not e!554061))))

(assert (=> b!982733 (= res!657365 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29676 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15410 (ValueCell!10922 V!35393) V!35393)

(declare-fun dynLambda!1809 (Int (_ BitVec 64)) V!35393)

(assert (=> b!982733 (= lt!436236 (get!15410 (select (arr!29677 _values!1278) from!1932) (dynLambda!1809 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35393)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3450 (array!61646 array!61648 (_ BitVec 32) (_ BitVec 32) V!35393 V!35393 (_ BitVec 32) Int) ListLongMap!13379)

(assert (=> b!982733 (= lt!436232 (getCurrentListMapNoExtraKeys!3450 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982734 () Bool)

(assert (=> b!982734 (= e!554064 tp_is_empty!22807)))

(declare-fun b!982735 () Bool)

(declare-fun res!657368 () Bool)

(assert (=> b!982735 (=> (not res!657368) (not e!554062))))

(assert (=> b!982735 (= res!657368 (and (= (size!30157 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30156 _keys!1544) (size!30157 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36239 () Bool)

(assert (=> mapIsEmpty!36239 mapRes!36239))

(declare-fun b!982736 () Bool)

(declare-fun res!657366 () Bool)

(assert (=> b!982736 (=> (not res!657366) (not e!554062))))

(assert (=> b!982736 (= res!657366 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982737 () Bool)

(assert (=> b!982737 (= e!554059 (and e!554063 mapRes!36239))))

(declare-fun condMapEmpty!36239 () Bool)

(declare-fun mapDefault!36239 () ValueCell!10922)

(assert (=> b!982737 (= condMapEmpty!36239 (= (arr!29677 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10922)) mapDefault!36239)))))

(assert (= (and start!84172 res!657363) b!982735))

(assert (= (and b!982735 res!657368) b!982730))

(assert (= (and b!982730 res!657370) b!982732))

(assert (= (and b!982732 res!657367) b!982728))

(assert (= (and b!982728 res!657364) b!982727))

(assert (= (and b!982727 res!657369) b!982736))

(assert (= (and b!982736 res!657366) b!982733))

(assert (= (and b!982733 res!657365) b!982731))

(assert (= (and b!982737 condMapEmpty!36239) mapIsEmpty!36239))

(assert (= (and b!982737 (not condMapEmpty!36239)) mapNonEmpty!36239))

(get-info :version)

(assert (= (and mapNonEmpty!36239 ((_ is ValueCellFull!10922) mapValue!36239)) b!982734))

(assert (= (and b!982737 ((_ is ValueCellFull!10922) mapDefault!36239)) b!982729))

(assert (= start!84172 b!982737))

(declare-fun b_lambda!14811 () Bool)

(assert (=> (not b_lambda!14811) (not b!982733)))

(declare-fun t!29257 () Bool)

(declare-fun tb!6551 () Bool)

(assert (=> (and start!84172 (= defaultEntry!1281 defaultEntry!1281) t!29257) tb!6551))

(declare-fun result!13099 () Bool)

(assert (=> tb!6551 (= result!13099 tp_is_empty!22807)))

(assert (=> b!982733 t!29257))

(declare-fun b_and!31613 () Bool)

(assert (= b_and!31611 (and (=> t!29257 result!13099) b_and!31613)))

(declare-fun m!910475 () Bool)

(assert (=> mapNonEmpty!36239 m!910475))

(declare-fun m!910477 () Bool)

(assert (=> start!84172 m!910477))

(declare-fun m!910479 () Bool)

(assert (=> start!84172 m!910479))

(declare-fun m!910481 () Bool)

(assert (=> start!84172 m!910481))

(declare-fun m!910483 () Bool)

(assert (=> b!982730 m!910483))

(declare-fun m!910485 () Bool)

(assert (=> b!982727 m!910485))

(assert (=> b!982727 m!910485))

(declare-fun m!910487 () Bool)

(assert (=> b!982727 m!910487))

(assert (=> b!982733 m!910485))

(declare-fun m!910489 () Bool)

(assert (=> b!982733 m!910489))

(declare-fun m!910491 () Bool)

(assert (=> b!982733 m!910491))

(declare-fun m!910493 () Bool)

(assert (=> b!982733 m!910493))

(assert (=> b!982733 m!910489))

(assert (=> b!982733 m!910493))

(declare-fun m!910495 () Bool)

(assert (=> b!982733 m!910495))

(assert (=> b!982731 m!910485))

(assert (=> b!982731 m!910485))

(declare-fun m!910497 () Bool)

(assert (=> b!982731 m!910497))

(declare-fun m!910499 () Bool)

(assert (=> b!982731 m!910499))

(declare-fun m!910501 () Bool)

(assert (=> b!982731 m!910501))

(declare-fun m!910503 () Bool)

(assert (=> b!982731 m!910503))

(declare-fun m!910505 () Bool)

(assert (=> b!982731 m!910505))

(assert (=> b!982731 m!910499))

(assert (=> b!982731 m!910503))

(declare-fun m!910507 () Bool)

(assert (=> b!982732 m!910507))

(check-sat (not b!982730) (not b!982731) b_and!31613 (not b_lambda!14811) (not b!982727) (not start!84172) (not b!982733) (not b!982732) (not b_next!19759) (not mapNonEmpty!36239) tp_is_empty!22807)
(check-sat b_and!31613 (not b_next!19759))
