; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112802 () Bool)

(assert start!112802)

(declare-fun b_free!31055 () Bool)

(declare-fun b_next!31055 () Bool)

(assert (=> start!112802 (= b_free!31055 (not b_next!31055))))

(declare-fun tp!108813 () Bool)

(declare-fun b_and!50057 () Bool)

(assert (=> start!112802 (= tp!108813 b_and!50057)))

(declare-fun res!887753 () Bool)

(declare-fun e!761789 () Bool)

(assert (=> start!112802 (=> (not res!887753) (not e!761789))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112802 (= res!887753 (validMask!0 mask!1998))))

(assert (=> start!112802 e!761789))

(declare-datatypes ((V!54389 0))(
  ( (V!54390 (val!18557 Int)) )
))
(declare-datatypes ((ValueCell!17584 0))(
  ( (ValueCellFull!17584 (v!21201 V!54389)) (EmptyCell!17584) )
))
(declare-datatypes ((array!90788 0))(
  ( (array!90789 (arr!43857 (Array (_ BitVec 32) ValueCell!17584)) (size!44407 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90788)

(declare-fun e!761788 () Bool)

(declare-fun array_inv!33075 (array!90788) Bool)

(assert (=> start!112802 (and (array_inv!33075 _values!1320) e!761788)))

(assert (=> start!112802 true))

(declare-datatypes ((array!90790 0))(
  ( (array!90791 (arr!43858 (Array (_ BitVec 32) (_ BitVec 64))) (size!44408 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90790)

(declare-fun array_inv!33076 (array!90790) Bool)

(assert (=> start!112802 (array_inv!33076 _keys!1590)))

(assert (=> start!112802 tp!108813))

(declare-fun tp_is_empty!36965 () Bool)

(assert (=> start!112802 tp_is_empty!36965))

(declare-fun b!1337854 () Bool)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1337854 (= e!761789 (= k!1153 (select (arr!43858 _keys!1590) from!1980)))))

(declare-fun b!1337855 () Bool)

(declare-fun e!761785 () Bool)

(assert (=> b!1337855 (= e!761785 tp_is_empty!36965)))

(declare-fun b!1337856 () Bool)

(declare-fun res!887758 () Bool)

(assert (=> b!1337856 (=> (not res!887758) (not e!761789))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54389)

(declare-fun zeroValue!1262 () V!54389)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23940 0))(
  ( (tuple2!23941 (_1!11981 (_ BitVec 64)) (_2!11981 V!54389)) )
))
(declare-datatypes ((List!31082 0))(
  ( (Nil!31079) (Cons!31078 (h!32287 tuple2!23940) (t!45406 List!31082)) )
))
(declare-datatypes ((ListLongMap!21597 0))(
  ( (ListLongMap!21598 (toList!10814 List!31082)) )
))
(declare-fun contains!8983 (ListLongMap!21597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5783 (array!90790 array!90788 (_ BitVec 32) (_ BitVec 32) V!54389 V!54389 (_ BitVec 32) Int) ListLongMap!21597)

(assert (=> b!1337856 (= res!887758 (contains!8983 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1337857 () Bool)

(declare-fun res!887756 () Bool)

(assert (=> b!1337857 (=> (not res!887756) (not e!761789))))

(assert (=> b!1337857 (= res!887756 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!57132 () Bool)

(declare-fun mapRes!57132 () Bool)

(assert (=> mapIsEmpty!57132 mapRes!57132))

(declare-fun b!1337858 () Bool)

(declare-fun res!887751 () Bool)

(assert (=> b!1337858 (=> (not res!887751) (not e!761789))))

(assert (=> b!1337858 (= res!887751 (not (= (select (arr!43858 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1337859 () Bool)

(declare-fun res!887752 () Bool)

(assert (=> b!1337859 (=> (not res!887752) (not e!761789))))

(declare-fun +!4750 (ListLongMap!21597 tuple2!23940) ListLongMap!21597)

(declare-fun getCurrentListMapNoExtraKeys!6392 (array!90790 array!90788 (_ BitVec 32) (_ BitVec 32) V!54389 V!54389 (_ BitVec 32) Int) ListLongMap!21597)

(declare-fun get!22138 (ValueCell!17584 V!54389) V!54389)

(declare-fun dynLambda!3689 (Int (_ BitVec 64)) V!54389)

(assert (=> b!1337859 (= res!887752 (contains!8983 (+!4750 (getCurrentListMapNoExtraKeys!6392 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23941 (select (arr!43858 _keys!1590) from!1980) (get!22138 (select (arr!43857 _values!1320) from!1980) (dynLambda!3689 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1153))))

(declare-fun b!1337860 () Bool)

(declare-fun res!887757 () Bool)

(assert (=> b!1337860 (=> (not res!887757) (not e!761789))))

(assert (=> b!1337860 (= res!887757 (and (= (size!44407 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44408 _keys!1590) (size!44407 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337861 () Bool)

(assert (=> b!1337861 (= e!761788 (and e!761785 mapRes!57132))))

(declare-fun condMapEmpty!57132 () Bool)

(declare-fun mapDefault!57132 () ValueCell!17584)

