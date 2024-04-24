; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84154 () Bool)

(assert start!84154)

(declare-fun b_free!19741 () Bool)

(declare-fun b_next!19741 () Bool)

(assert (=> start!84154 (= b_free!19741 (not b_next!19741))))

(declare-fun tp!68747 () Bool)

(declare-fun b_and!31575 () Bool)

(assert (=> start!84154 (= tp!68747 b_and!31575)))

(declare-fun b!982412 () Bool)

(declare-fun e!553898 () Bool)

(declare-fun e!553902 () Bool)

(assert (=> b!982412 (= e!553898 e!553902)))

(declare-fun res!657151 () Bool)

(assert (=> b!982412 (=> (not res!657151) (not e!553902))))

(declare-datatypes ((array!61610 0))(
  ( (array!61611 (arr!29658 (Array (_ BitVec 32) (_ BitVec 64))) (size!30138 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61610)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982412 (= res!657151 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29658 _keys!1544) from!1932))))))

(declare-datatypes ((V!35369 0))(
  ( (V!35370 (val!11445 Int)) )
))
(declare-datatypes ((ValueCell!10913 0))(
  ( (ValueCellFull!10913 (v!14004 V!35369)) (EmptyCell!10913) )
))
(declare-datatypes ((array!61612 0))(
  ( (array!61613 (arr!29659 (Array (_ BitVec 32) ValueCell!10913)) (size!30139 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61612)

(declare-fun lt!436098 () V!35369)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15397 (ValueCell!10913 V!35369) V!35369)

(declare-fun dynLambda!1802 (Int (_ BitVec 64)) V!35369)

(assert (=> b!982412 (= lt!436098 (get!15397 (select (arr!29659 _values!1278) from!1932) (dynLambda!1802 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35369)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35369)

(declare-datatypes ((tuple2!14664 0))(
  ( (tuple2!14665 (_1!7343 (_ BitVec 64)) (_2!7343 V!35369)) )
))
(declare-datatypes ((List!20542 0))(
  ( (Nil!20539) (Cons!20538 (h!21706 tuple2!14664) (t!29225 List!20542)) )
))
(declare-datatypes ((ListLongMap!13363 0))(
  ( (ListLongMap!13364 (toList!6697 List!20542)) )
))
(declare-fun lt!436099 () ListLongMap!13363)

(declare-fun getCurrentListMapNoExtraKeys!3443 (array!61610 array!61612 (_ BitVec 32) (_ BitVec 32) V!35369 V!35369 (_ BitVec 32) Int) ListLongMap!13363)

(assert (=> b!982412 (= lt!436099 (getCurrentListMapNoExtraKeys!3443 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982414 () Bool)

(declare-fun e!553900 () Bool)

(declare-fun e!553897 () Bool)

(declare-fun mapRes!36212 () Bool)

(assert (=> b!982414 (= e!553900 (and e!553897 mapRes!36212))))

(declare-fun condMapEmpty!36212 () Bool)

(declare-fun mapDefault!36212 () ValueCell!10913)

(assert (=> b!982414 (= condMapEmpty!36212 (= (arr!29659 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10913)) mapDefault!36212)))))

(declare-fun b!982415 () Bool)

(declare-fun tp_is_empty!22789 () Bool)

(assert (=> b!982415 (= e!553897 tp_is_empty!22789)))

(declare-fun b!982416 () Bool)

(assert (=> b!982416 (= e!553902 (not true))))

(declare-fun lt!436101 () tuple2!14664)

(declare-fun lt!436097 () tuple2!14664)

(declare-fun +!3008 (ListLongMap!13363 tuple2!14664) ListLongMap!13363)

(assert (=> b!982416 (= (+!3008 (+!3008 lt!436099 lt!436101) lt!436097) (+!3008 (+!3008 lt!436099 lt!436097) lt!436101))))

(assert (=> b!982416 (= lt!436097 (tuple2!14665 (select (arr!29658 _keys!1544) from!1932) lt!436098))))

(assert (=> b!982416 (= lt!436101 (tuple2!14665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32596 0))(
  ( (Unit!32597) )
))
(declare-fun lt!436100 () Unit!32596)

(declare-fun addCommutativeForDiffKeys!615 (ListLongMap!13363 (_ BitVec 64) V!35369 (_ BitVec 64) V!35369) Unit!32596)

(assert (=> b!982416 (= lt!436100 (addCommutativeForDiffKeys!615 lt!436099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29658 _keys!1544) from!1932) lt!436098))))

(declare-fun b!982417 () Bool)

(declare-fun res!657152 () Bool)

(assert (=> b!982417 (=> (not res!657152) (not e!553898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982417 (= res!657152 (validKeyInArray!0 (select (arr!29658 _keys!1544) from!1932)))))

(declare-fun b!982418 () Bool)

(declare-fun res!657149 () Bool)

(assert (=> b!982418 (=> (not res!657149) (not e!553898))))

(assert (=> b!982418 (= res!657149 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30138 _keys!1544))))))

(declare-fun mapNonEmpty!36212 () Bool)

(declare-fun tp!68746 () Bool)

(declare-fun e!553901 () Bool)

(assert (=> mapNonEmpty!36212 (= mapRes!36212 (and tp!68746 e!553901))))

(declare-fun mapValue!36212 () ValueCell!10913)

(declare-fun mapKey!36212 () (_ BitVec 32))

(declare-fun mapRest!36212 () (Array (_ BitVec 32) ValueCell!10913))

(assert (=> mapNonEmpty!36212 (= (arr!29659 _values!1278) (store mapRest!36212 mapKey!36212 mapValue!36212))))

(declare-fun b!982419 () Bool)

(assert (=> b!982419 (= e!553901 tp_is_empty!22789)))

(declare-fun b!982413 () Bool)

(declare-fun res!657154 () Bool)

(assert (=> b!982413 (=> (not res!657154) (not e!553898))))

(assert (=> b!982413 (= res!657154 (and (= (size!30139 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30138 _keys!1544) (size!30139 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!657147 () Bool)

(assert (=> start!84154 (=> (not res!657147) (not e!553898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84154 (= res!657147 (validMask!0 mask!1948))))

(assert (=> start!84154 e!553898))

(assert (=> start!84154 true))

(assert (=> start!84154 tp_is_empty!22789))

(declare-fun array_inv!22951 (array!61612) Bool)

(assert (=> start!84154 (and (array_inv!22951 _values!1278) e!553900)))

(assert (=> start!84154 tp!68747))

(declare-fun array_inv!22952 (array!61610) Bool)

(assert (=> start!84154 (array_inv!22952 _keys!1544)))

(declare-fun mapIsEmpty!36212 () Bool)

(assert (=> mapIsEmpty!36212 mapRes!36212))

(declare-fun b!982420 () Bool)

(declare-fun res!657148 () Bool)

(assert (=> b!982420 (=> (not res!657148) (not e!553898))))

(declare-datatypes ((List!20543 0))(
  ( (Nil!20540) (Cons!20539 (h!21707 (_ BitVec 64)) (t!29226 List!20543)) )
))
(declare-fun arrayNoDuplicates!0 (array!61610 (_ BitVec 32) List!20543) Bool)

(assert (=> b!982420 (= res!657148 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20540))))

(declare-fun b!982421 () Bool)

(declare-fun res!657150 () Bool)

(assert (=> b!982421 (=> (not res!657150) (not e!553898))))

(assert (=> b!982421 (= res!657150 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982422 () Bool)

(declare-fun res!657153 () Bool)

(assert (=> b!982422 (=> (not res!657153) (not e!553898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61610 (_ BitVec 32)) Bool)

(assert (=> b!982422 (= res!657153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84154 res!657147) b!982413))

(assert (= (and b!982413 res!657154) b!982422))

(assert (= (and b!982422 res!657153) b!982420))

(assert (= (and b!982420 res!657148) b!982418))

(assert (= (and b!982418 res!657149) b!982417))

(assert (= (and b!982417 res!657152) b!982421))

(assert (= (and b!982421 res!657150) b!982412))

(assert (= (and b!982412 res!657151) b!982416))

(assert (= (and b!982414 condMapEmpty!36212) mapIsEmpty!36212))

(assert (= (and b!982414 (not condMapEmpty!36212)) mapNonEmpty!36212))

(get-info :version)

(assert (= (and mapNonEmpty!36212 ((_ is ValueCellFull!10913) mapValue!36212)) b!982419))

(assert (= (and b!982414 ((_ is ValueCellFull!10913) mapDefault!36212)) b!982415))

(assert (= start!84154 b!982414))

(declare-fun b_lambda!14793 () Bool)

(assert (=> (not b_lambda!14793) (not b!982412)))

(declare-fun t!29224 () Bool)

(declare-fun tb!6533 () Bool)

(assert (=> (and start!84154 (= defaultEntry!1281 defaultEntry!1281) t!29224) tb!6533))

(declare-fun result!13063 () Bool)

(assert (=> tb!6533 (= result!13063 tp_is_empty!22789)))

(assert (=> b!982412 t!29224))

(declare-fun b_and!31577 () Bool)

(assert (= b_and!31575 (and (=> t!29224 result!13063) b_and!31577)))

(declare-fun m!910169 () Bool)

(assert (=> b!982420 m!910169))

(declare-fun m!910171 () Bool)

(assert (=> start!84154 m!910171))

(declare-fun m!910173 () Bool)

(assert (=> start!84154 m!910173))

(declare-fun m!910175 () Bool)

(assert (=> start!84154 m!910175))

(declare-fun m!910177 () Bool)

(assert (=> mapNonEmpty!36212 m!910177))

(declare-fun m!910179 () Bool)

(assert (=> b!982422 m!910179))

(declare-fun m!910181 () Bool)

(assert (=> b!982416 m!910181))

(declare-fun m!910183 () Bool)

(assert (=> b!982416 m!910183))

(declare-fun m!910185 () Bool)

(assert (=> b!982416 m!910185))

(declare-fun m!910187 () Bool)

(assert (=> b!982416 m!910187))

(assert (=> b!982416 m!910181))

(declare-fun m!910189 () Bool)

(assert (=> b!982416 m!910189))

(assert (=> b!982416 m!910187))

(declare-fun m!910191 () Bool)

(assert (=> b!982416 m!910191))

(assert (=> b!982416 m!910183))

(assert (=> b!982412 m!910181))

(declare-fun m!910193 () Bool)

(assert (=> b!982412 m!910193))

(declare-fun m!910195 () Bool)

(assert (=> b!982412 m!910195))

(declare-fun m!910197 () Bool)

(assert (=> b!982412 m!910197))

(assert (=> b!982412 m!910193))

(assert (=> b!982412 m!910197))

(declare-fun m!910199 () Bool)

(assert (=> b!982412 m!910199))

(assert (=> b!982417 m!910181))

(assert (=> b!982417 m!910181))

(declare-fun m!910201 () Bool)

(assert (=> b!982417 m!910201))

(check-sat (not b_lambda!14793) (not start!84154) b_and!31577 (not b!982422) (not b!982420) (not b!982416) tp_is_empty!22789 (not b!982417) (not b_next!19741) (not b!982412) (not mapNonEmpty!36212))
(check-sat b_and!31577 (not b_next!19741))
