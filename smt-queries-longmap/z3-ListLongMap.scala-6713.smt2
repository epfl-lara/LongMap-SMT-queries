; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84418 () Bool)

(assert start!84418)

(declare-fun b_free!19951 () Bool)

(declare-fun b_next!19951 () Bool)

(assert (=> start!84418 (= b_free!19951 (not b_next!19951))))

(declare-fun tp!69458 () Bool)

(declare-fun b_and!31989 () Bool)

(assert (=> start!84418 (= tp!69458 b_and!31989)))

(declare-fun b!986585 () Bool)

(declare-fun res!659929 () Bool)

(declare-fun e!556184 () Bool)

(assert (=> b!986585 (=> (not res!659929) (not e!556184))))

(declare-datatypes ((array!62120 0))(
  ( (array!62121 (arr!29913 (Array (_ BitVec 32) (_ BitVec 64))) (size!30393 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62120)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62120 (_ BitVec 32)) Bool)

(assert (=> b!986585 (= res!659929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986586 () Bool)

(declare-fun e!556188 () Bool)

(assert (=> b!986586 (= e!556184 e!556188)))

(declare-fun res!659928 () Bool)

(assert (=> b!986586 (=> (not res!659928) (not e!556188))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986586 (= res!659928 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29913 _keys!1544) from!1932))))))

(declare-datatypes ((V!35721 0))(
  ( (V!35722 (val!11577 Int)) )
))
(declare-fun lt!437711 () V!35721)

(declare-datatypes ((ValueCell!11045 0))(
  ( (ValueCellFull!11045 (v!14136 V!35721)) (EmptyCell!11045) )
))
(declare-datatypes ((array!62122 0))(
  ( (array!62123 (arr!29914 (Array (_ BitVec 32) ValueCell!11045)) (size!30394 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62122)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15555 (ValueCell!11045 V!35721) V!35721)

(declare-fun dynLambda!1872 (Int (_ BitVec 64)) V!35721)

(assert (=> b!986586 (= lt!437711 (get!15555 (select (arr!29914 _values!1278) from!1932) (dynLambda!1872 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35721)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35721)

(declare-datatypes ((tuple2!14838 0))(
  ( (tuple2!14839 (_1!7430 (_ BitVec 64)) (_2!7430 V!35721)) )
))
(declare-datatypes ((List!20713 0))(
  ( (Nil!20710) (Cons!20709 (h!21877 tuple2!14838) (t!29600 List!20713)) )
))
(declare-datatypes ((ListLongMap!13537 0))(
  ( (ListLongMap!13538 (toList!6784 List!20713)) )
))
(declare-fun lt!437709 () ListLongMap!13537)

(declare-fun getCurrentListMapNoExtraKeys!3515 (array!62120 array!62122 (_ BitVec 32) (_ BitVec 32) V!35721 V!35721 (_ BitVec 32) Int) ListLongMap!13537)

(assert (=> b!986586 (= lt!437709 (getCurrentListMapNoExtraKeys!3515 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!986587 () Bool)

(declare-fun res!659931 () Bool)

(assert (=> b!986587 (=> (not res!659931) (not e!556184))))

(assert (=> b!986587 (= res!659931 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986589 () Bool)

(declare-fun res!659934 () Bool)

(assert (=> b!986589 (=> (not res!659934) (not e!556184))))

(assert (=> b!986589 (= res!659934 (and (= (size!30394 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30393 _keys!1544) (size!30394 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36608 () Bool)

(declare-fun mapRes!36608 () Bool)

(assert (=> mapIsEmpty!36608 mapRes!36608))

(declare-fun b!986590 () Bool)

(declare-fun e!556183 () Bool)

(declare-fun tp_is_empty!23053 () Bool)

(assert (=> b!986590 (= e!556183 tp_is_empty!23053)))

(declare-fun b!986591 () Bool)

(declare-fun res!659932 () Bool)

(assert (=> b!986591 (=> (not res!659932) (not e!556184))))

(assert (=> b!986591 (= res!659932 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30393 _keys!1544))))))

(declare-fun b!986592 () Bool)

(declare-fun res!659930 () Bool)

(assert (=> b!986592 (=> (not res!659930) (not e!556184))))

(declare-datatypes ((List!20714 0))(
  ( (Nil!20711) (Cons!20710 (h!21878 (_ BitVec 64)) (t!29601 List!20714)) )
))
(declare-fun arrayNoDuplicates!0 (array!62120 (_ BitVec 32) List!20714) Bool)

(assert (=> b!986592 (= res!659930 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20711))))

(declare-fun b!986593 () Bool)

(declare-fun res!659935 () Bool)

(assert (=> b!986593 (=> (not res!659935) (not e!556184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986593 (= res!659935 (validKeyInArray!0 (select (arr!29913 _keys!1544) from!1932)))))

(declare-fun b!986594 () Bool)

(declare-fun e!556187 () Bool)

(assert (=> b!986594 (= e!556187 tp_is_empty!23053)))

(declare-fun b!986595 () Bool)

(assert (=> b!986595 (= e!556188 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun lt!437710 () tuple2!14838)

(declare-fun lt!437708 () tuple2!14838)

(declare-fun +!3083 (ListLongMap!13537 tuple2!14838) ListLongMap!13537)

(assert (=> b!986595 (= (+!3083 (+!3083 lt!437709 lt!437710) lt!437708) (+!3083 (+!3083 lt!437709 lt!437708) lt!437710))))

(assert (=> b!986595 (= lt!437708 (tuple2!14839 (select (arr!29913 _keys!1544) from!1932) lt!437711))))

(assert (=> b!986595 (= lt!437710 (tuple2!14839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32746 0))(
  ( (Unit!32747) )
))
(declare-fun lt!437712 () Unit!32746)

(declare-fun addCommutativeForDiffKeys!690 (ListLongMap!13537 (_ BitVec 64) V!35721 (_ BitVec 64) V!35721) Unit!32746)

(assert (=> b!986595 (= lt!437712 (addCommutativeForDiffKeys!690 lt!437709 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29913 _keys!1544) from!1932) lt!437711))))

(declare-fun mapNonEmpty!36608 () Bool)

(declare-fun tp!69457 () Bool)

(assert (=> mapNonEmpty!36608 (= mapRes!36608 (and tp!69457 e!556187))))

(declare-fun mapValue!36608 () ValueCell!11045)

(declare-fun mapKey!36608 () (_ BitVec 32))

(declare-fun mapRest!36608 () (Array (_ BitVec 32) ValueCell!11045))

(assert (=> mapNonEmpty!36608 (= (arr!29914 _values!1278) (store mapRest!36608 mapKey!36608 mapValue!36608))))

(declare-fun res!659933 () Bool)

(assert (=> start!84418 (=> (not res!659933) (not e!556184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84418 (= res!659933 (validMask!0 mask!1948))))

(assert (=> start!84418 e!556184))

(assert (=> start!84418 true))

(assert (=> start!84418 tp_is_empty!23053))

(declare-fun e!556186 () Bool)

(declare-fun array_inv!23137 (array!62122) Bool)

(assert (=> start!84418 (and (array_inv!23137 _values!1278) e!556186)))

(assert (=> start!84418 tp!69458))

(declare-fun array_inv!23138 (array!62120) Bool)

(assert (=> start!84418 (array_inv!23138 _keys!1544)))

(declare-fun b!986588 () Bool)

(assert (=> b!986588 (= e!556186 (and e!556183 mapRes!36608))))

(declare-fun condMapEmpty!36608 () Bool)

(declare-fun mapDefault!36608 () ValueCell!11045)

(assert (=> b!986588 (= condMapEmpty!36608 (= (arr!29914 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11045)) mapDefault!36608)))))

(assert (= (and start!84418 res!659933) b!986589))

(assert (= (and b!986589 res!659934) b!986585))

(assert (= (and b!986585 res!659929) b!986592))

(assert (= (and b!986592 res!659930) b!986591))

(assert (= (and b!986591 res!659932) b!986593))

(assert (= (and b!986593 res!659935) b!986587))

(assert (= (and b!986587 res!659931) b!986586))

(assert (= (and b!986586 res!659928) b!986595))

(assert (= (and b!986588 condMapEmpty!36608) mapIsEmpty!36608))

(assert (= (and b!986588 (not condMapEmpty!36608)) mapNonEmpty!36608))

(get-info :version)

(assert (= (and mapNonEmpty!36608 ((_ is ValueCellFull!11045) mapValue!36608)) b!986594))

(assert (= (and b!986588 ((_ is ValueCellFull!11045) mapDefault!36608)) b!986590))

(assert (= start!84418 b!986588))

(declare-fun b_lambda!14997 () Bool)

(assert (=> (not b_lambda!14997) (not b!986586)))

(declare-fun t!29599 () Bool)

(declare-fun tb!6737 () Bool)

(assert (=> (and start!84418 (= defaultEntry!1281 defaultEntry!1281) t!29599) tb!6737))

(declare-fun result!13471 () Bool)

(assert (=> tb!6737 (= result!13471 tp_is_empty!23053)))

(assert (=> b!986586 t!29599))

(declare-fun b_and!31991 () Bool)

(assert (= b_and!31989 (and (=> t!29599 result!13471) b_and!31991)))

(declare-fun m!914027 () Bool)

(assert (=> b!986586 m!914027))

(declare-fun m!914029 () Bool)

(assert (=> b!986586 m!914029))

(declare-fun m!914031 () Bool)

(assert (=> b!986586 m!914031))

(declare-fun m!914033 () Bool)

(assert (=> b!986586 m!914033))

(assert (=> b!986586 m!914029))

(assert (=> b!986586 m!914033))

(declare-fun m!914035 () Bool)

(assert (=> b!986586 m!914035))

(declare-fun m!914037 () Bool)

(assert (=> b!986585 m!914037))

(declare-fun m!914039 () Bool)

(assert (=> start!84418 m!914039))

(declare-fun m!914041 () Bool)

(assert (=> start!84418 m!914041))

(declare-fun m!914043 () Bool)

(assert (=> start!84418 m!914043))

(declare-fun m!914045 () Bool)

(assert (=> b!986592 m!914045))

(assert (=> b!986595 m!914027))

(declare-fun m!914047 () Bool)

(assert (=> b!986595 m!914047))

(assert (=> b!986595 m!914027))

(declare-fun m!914049 () Bool)

(assert (=> b!986595 m!914049))

(assert (=> b!986595 m!914047))

(declare-fun m!914051 () Bool)

(assert (=> b!986595 m!914051))

(declare-fun m!914053 () Bool)

(assert (=> b!986595 m!914053))

(assert (=> b!986595 m!914053))

(declare-fun m!914055 () Bool)

(assert (=> b!986595 m!914055))

(assert (=> b!986593 m!914027))

(assert (=> b!986593 m!914027))

(declare-fun m!914057 () Bool)

(assert (=> b!986593 m!914057))

(declare-fun m!914059 () Bool)

(assert (=> mapNonEmpty!36608 m!914059))

(check-sat (not b!986586) b_and!31991 (not b_lambda!14997) (not b!986585) (not b!986593) (not start!84418) (not b_next!19951) (not b!986595) (not mapNonEmpty!36608) (not b!986592) tp_is_empty!23053)
(check-sat b_and!31991 (not b_next!19951))
