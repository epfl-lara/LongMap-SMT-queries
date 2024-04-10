; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113250 () Bool)

(assert start!113250)

(declare-fun b_free!31301 () Bool)

(declare-fun b_next!31301 () Bool)

(assert (=> start!113250 (= b_free!31301 (not b_next!31301))))

(declare-fun tp!109707 () Bool)

(declare-fun b_and!50509 () Bool)

(assert (=> start!113250 (= tp!109707 b_and!50509)))

(declare-fun mapIsEmpty!57658 () Bool)

(declare-fun mapRes!57658 () Bool)

(assert (=> mapIsEmpty!57658 mapRes!57658))

(declare-fun res!891468 () Bool)

(declare-fun e!764738 () Bool)

(assert (=> start!113250 (=> (not res!891468) (not e!764738))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113250 (= res!891468 (validMask!0 mask!1977))))

(assert (=> start!113250 e!764738))

(declare-fun tp_is_empty!37301 () Bool)

(assert (=> start!113250 tp_is_empty!37301))

(assert (=> start!113250 true))

(declare-datatypes ((array!91446 0))(
  ( (array!91447 (arr!44179 (Array (_ BitVec 32) (_ BitVec 64))) (size!44729 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91446)

(declare-fun array_inv!33301 (array!91446) Bool)

(assert (=> start!113250 (array_inv!33301 _keys!1571)))

(declare-datatypes ((V!54837 0))(
  ( (V!54838 (val!18725 Int)) )
))
(declare-datatypes ((ValueCell!17752 0))(
  ( (ValueCellFull!17752 (v!21373 V!54837)) (EmptyCell!17752) )
))
(declare-datatypes ((array!91448 0))(
  ( (array!91449 (arr!44180 (Array (_ BitVec 32) ValueCell!17752)) (size!44730 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91448)

(declare-fun e!764734 () Bool)

(declare-fun array_inv!33302 (array!91448) Bool)

(assert (=> start!113250 (and (array_inv!33302 _values!1303) e!764734)))

(assert (=> start!113250 tp!109707))

(declare-fun b!1343613 () Bool)

(declare-fun e!764735 () Bool)

(assert (=> b!1343613 (= e!764735 tp_is_empty!37301)))

(declare-fun b!1343614 () Bool)

(declare-fun res!891460 () Bool)

(assert (=> b!1343614 (=> (not res!891460) (not e!764738))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343614 (= res!891460 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343615 () Bool)

(assert (=> b!1343615 (= e!764738 (not true))))

(declare-datatypes ((tuple2!24124 0))(
  ( (tuple2!24125 (_1!12073 (_ BitVec 64)) (_2!12073 V!54837)) )
))
(declare-datatypes ((List!31281 0))(
  ( (Nil!31278) (Cons!31277 (h!32486 tuple2!24124) (t!45793 List!31281)) )
))
(declare-datatypes ((ListLongMap!21781 0))(
  ( (ListLongMap!21782 (toList!10906 List!31281)) )
))
(declare-fun lt!595010 () ListLongMap!21781)

(declare-fun zeroValue!1245 () V!54837)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9082 (ListLongMap!21781 (_ BitVec 64)) Bool)

(declare-fun +!4814 (ListLongMap!21781 tuple2!24124) ListLongMap!21781)

(assert (=> b!1343615 (contains!9082 (+!4814 lt!595010 (tuple2!24125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44105 0))(
  ( (Unit!44106) )
))
(declare-fun lt!595011 () Unit!44105)

(declare-fun addStillContains!1207 (ListLongMap!21781 (_ BitVec 64) V!54837 (_ BitVec 64)) Unit!44105)

(assert (=> b!1343615 (= lt!595011 (addStillContains!1207 lt!595010 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343615 (contains!9082 lt!595010 k!1142)))

(declare-fun lt!595008 () V!54837)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595009 () Unit!44105)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!383 ((_ BitVec 64) (_ BitVec 64) V!54837 ListLongMap!21781) Unit!44105)

(assert (=> b!1343615 (= lt!595009 (lemmaInListMapAfterAddingDiffThenInBefore!383 k!1142 (select (arr!44179 _keys!1571) from!1960) lt!595008 lt!595010))))

(declare-fun lt!595006 () ListLongMap!21781)

(assert (=> b!1343615 (contains!9082 lt!595006 k!1142)))

(declare-fun lt!595007 () Unit!44105)

(assert (=> b!1343615 (= lt!595007 (lemmaInListMapAfterAddingDiffThenInBefore!383 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595006))))

(assert (=> b!1343615 (= lt!595006 (+!4814 lt!595010 (tuple2!24125 (select (arr!44179 _keys!1571) from!1960) lt!595008)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22319 (ValueCell!17752 V!54837) V!54837)

(declare-fun dynLambda!3753 (Int (_ BitVec 64)) V!54837)

(assert (=> b!1343615 (= lt!595008 (get!22319 (select (arr!44180 _values!1303) from!1960) (dynLambda!3753 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54837)

(declare-fun getCurrentListMapNoExtraKeys!6456 (array!91446 array!91448 (_ BitVec 32) (_ BitVec 32) V!54837 V!54837 (_ BitVec 32) Int) ListLongMap!21781)

(assert (=> b!1343615 (= lt!595010 (getCurrentListMapNoExtraKeys!6456 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343616 () Bool)

(declare-fun e!764737 () Bool)

(assert (=> b!1343616 (= e!764737 tp_is_empty!37301)))

(declare-fun b!1343617 () Bool)

(declare-fun res!891461 () Bool)

(assert (=> b!1343617 (=> (not res!891461) (not e!764738))))

(declare-datatypes ((List!31282 0))(
  ( (Nil!31279) (Cons!31278 (h!32487 (_ BitVec 64)) (t!45794 List!31282)) )
))
(declare-fun arrayNoDuplicates!0 (array!91446 (_ BitVec 32) List!31282) Bool)

(assert (=> b!1343617 (= res!891461 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31279))))

(declare-fun mapNonEmpty!57658 () Bool)

(declare-fun tp!109708 () Bool)

(assert (=> mapNonEmpty!57658 (= mapRes!57658 (and tp!109708 e!764737))))

(declare-fun mapKey!57658 () (_ BitVec 32))

(declare-fun mapValue!57658 () ValueCell!17752)

(declare-fun mapRest!57658 () (Array (_ BitVec 32) ValueCell!17752))

(assert (=> mapNonEmpty!57658 (= (arr!44180 _values!1303) (store mapRest!57658 mapKey!57658 mapValue!57658))))

(declare-fun b!1343618 () Bool)

(declare-fun res!891465 () Bool)

(assert (=> b!1343618 (=> (not res!891465) (not e!764738))))

(assert (=> b!1343618 (= res!891465 (not (= (select (arr!44179 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1343619 () Bool)

(declare-fun res!891463 () Bool)

(assert (=> b!1343619 (=> (not res!891463) (not e!764738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343619 (= res!891463 (validKeyInArray!0 (select (arr!44179 _keys!1571) from!1960)))))

(declare-fun b!1343620 () Bool)

(assert (=> b!1343620 (= e!764734 (and e!764735 mapRes!57658))))

(declare-fun condMapEmpty!57658 () Bool)

(declare-fun mapDefault!57658 () ValueCell!17752)

