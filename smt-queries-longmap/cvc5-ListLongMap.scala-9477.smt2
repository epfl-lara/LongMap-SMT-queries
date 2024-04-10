; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112470 () Bool)

(assert start!112470)

(declare-fun b_free!30865 () Bool)

(declare-fun b_next!30865 () Bool)

(assert (=> start!112470 (= b_free!30865 (not b_next!30865))))

(declare-fun tp!108232 () Bool)

(declare-fun b_and!49731 () Bool)

(assert (=> start!112470 (= tp!108232 b_and!49731)))

(declare-fun b!1333686 () Bool)

(declare-fun e!759711 () Bool)

(declare-fun tp_is_empty!36775 () Bool)

(assert (=> b!1333686 (= e!759711 tp_is_empty!36775)))

(declare-fun b!1333687 () Bool)

(declare-fun res!885081 () Bool)

(declare-fun e!759709 () Bool)

(assert (=> b!1333687 (=> (not res!885081) (not e!759709))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90420 0))(
  ( (array!90421 (arr!43676 (Array (_ BitVec 32) (_ BitVec 64))) (size!44226 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90420)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333687 (= res!885081 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44226 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333688 () Bool)

(declare-fun res!885083 () Bool)

(assert (=> b!1333688 (=> (not res!885083) (not e!759709))))

(assert (=> b!1333688 (= res!885083 (not (= (select (arr!43676 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1333689 () Bool)

(declare-fun res!885078 () Bool)

(assert (=> b!1333689 (=> (not res!885078) (not e!759709))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90420 (_ BitVec 32)) Bool)

(assert (=> b!1333689 (= res!885078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333690 () Bool)

(declare-fun e!759707 () Bool)

(assert (=> b!1333690 (= e!759709 e!759707)))

(declare-fun res!885077 () Bool)

(assert (=> b!1333690 (=> (not res!885077) (not e!759707))))

(declare-datatypes ((V!54137 0))(
  ( (V!54138 (val!18462 Int)) )
))
(declare-fun lt!592182 () V!54137)

(declare-datatypes ((tuple2!23798 0))(
  ( (tuple2!23799 (_1!11910 (_ BitVec 64)) (_2!11910 V!54137)) )
))
(declare-datatypes ((List!30942 0))(
  ( (Nil!30939) (Cons!30938 (h!32147 tuple2!23798) (t!45166 List!30942)) )
))
(declare-datatypes ((ListLongMap!21455 0))(
  ( (ListLongMap!21456 (toList!10743 List!30942)) )
))
(declare-fun lt!592181 () ListLongMap!21455)

(declare-fun contains!8907 (ListLongMap!21455 (_ BitVec 64)) Bool)

(declare-fun +!4715 (ListLongMap!21455 tuple2!23798) ListLongMap!21455)

(assert (=> b!1333690 (= res!885077 (contains!8907 (+!4715 lt!592181 (tuple2!23799 (select (arr!43676 _keys!1590) from!1980) lt!592182)) k!1153))))

(declare-datatypes ((ValueCell!17489 0))(
  ( (ValueCellFull!17489 (v!21099 V!54137)) (EmptyCell!17489) )
))
(declare-datatypes ((array!90422 0))(
  ( (array!90423 (arr!43677 (Array (_ BitVec 32) ValueCell!17489)) (size!44227 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90422)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54137)

(declare-fun zeroValue!1262 () V!54137)

(declare-fun getCurrentListMapNoExtraKeys!6353 (array!90420 array!90422 (_ BitVec 32) (_ BitVec 32) V!54137 V!54137 (_ BitVec 32) Int) ListLongMap!21455)

(assert (=> b!1333690 (= lt!592181 (getCurrentListMapNoExtraKeys!6353 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22033 (ValueCell!17489 V!54137) V!54137)

(declare-fun dynLambda!3654 (Int (_ BitVec 64)) V!54137)

(assert (=> b!1333690 (= lt!592182 (get!22033 (select (arr!43677 _values!1320) from!1980) (dynLambda!3654 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333691 () Bool)

(declare-fun res!885079 () Bool)

(assert (=> b!1333691 (=> (not res!885079) (not e!759709))))

(assert (=> b!1333691 (= res!885079 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!56836 () Bool)

(declare-fun mapRes!56836 () Bool)

(assert (=> mapIsEmpty!56836 mapRes!56836))

(declare-fun res!885080 () Bool)

(assert (=> start!112470 (=> (not res!885080) (not e!759709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112470 (= res!885080 (validMask!0 mask!1998))))

(assert (=> start!112470 e!759709))

(declare-fun e!759712 () Bool)

(declare-fun array_inv!32941 (array!90422) Bool)

(assert (=> start!112470 (and (array_inv!32941 _values!1320) e!759712)))

(assert (=> start!112470 true))

(declare-fun array_inv!32942 (array!90420) Bool)

(assert (=> start!112470 (array_inv!32942 _keys!1590)))

(assert (=> start!112470 tp!108232))

(assert (=> start!112470 tp_is_empty!36775))

(declare-fun b!1333692 () Bool)

(declare-fun res!885087 () Bool)

(assert (=> b!1333692 (=> (not res!885087) (not e!759707))))

(assert (=> b!1333692 (= res!885087 (not (= k!1153 (select (arr!43676 _keys!1590) from!1980))))))

(declare-fun b!1333693 () Bool)

(declare-fun res!885082 () Bool)

(assert (=> b!1333693 (=> (not res!885082) (not e!759709))))

(declare-datatypes ((List!30943 0))(
  ( (Nil!30940) (Cons!30939 (h!32148 (_ BitVec 64)) (t!45167 List!30943)) )
))
(declare-fun arrayNoDuplicates!0 (array!90420 (_ BitVec 32) List!30943) Bool)

(assert (=> b!1333693 (= res!885082 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30940))))

(declare-fun b!1333694 () Bool)

(declare-fun res!885084 () Bool)

(assert (=> b!1333694 (=> (not res!885084) (not e!759709))))

(assert (=> b!1333694 (= res!885084 (and (= (size!44227 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44226 _keys!1590) (size!44227 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333695 () Bool)

(declare-fun res!885085 () Bool)

(assert (=> b!1333695 (=> (not res!885085) (not e!759709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333695 (= res!885085 (validKeyInArray!0 (select (arr!43676 _keys!1590) from!1980)))))

(declare-fun b!1333696 () Bool)

(assert (=> b!1333696 (= e!759712 (and e!759711 mapRes!56836))))

(declare-fun condMapEmpty!56836 () Bool)

(declare-fun mapDefault!56836 () ValueCell!17489)

