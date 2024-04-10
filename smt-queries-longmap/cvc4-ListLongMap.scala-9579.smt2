; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113340 () Bool)

(assert start!113340)

(declare-fun b_free!31391 () Bool)

(declare-fun b_next!31391 () Bool)

(assert (=> start!113340 (= b_free!31391 (not b_next!31391))))

(declare-fun tp!109977 () Bool)

(declare-fun b_and!50635 () Bool)

(assert (=> start!113340 (= tp!109977 b_and!50635)))

(declare-fun b!1345006 () Bool)

(declare-fun res!892414 () Bool)

(declare-fun e!765427 () Bool)

(assert (=> b!1345006 (=> (not res!892414) (not e!765427))))

(declare-datatypes ((V!54957 0))(
  ( (V!54958 (val!18770 Int)) )
))
(declare-fun minValue!1245 () V!54957)

(declare-fun zeroValue!1245 () V!54957)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17797 0))(
  ( (ValueCellFull!17797 (v!21418 V!54957)) (EmptyCell!17797) )
))
(declare-datatypes ((array!91622 0))(
  ( (array!91623 (arr!44267 (Array (_ BitVec 32) ValueCell!17797)) (size!44817 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91622)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91624 0))(
  ( (array!91625 (arr!44268 (Array (_ BitVec 32) (_ BitVec 64))) (size!44818 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91624)

(declare-datatypes ((tuple2!24194 0))(
  ( (tuple2!24195 (_1!12108 (_ BitVec 64)) (_2!12108 V!54957)) )
))
(declare-datatypes ((List!31350 0))(
  ( (Nil!31347) (Cons!31346 (h!32555 tuple2!24194) (t!45898 List!31350)) )
))
(declare-datatypes ((ListLongMap!21851 0))(
  ( (ListLongMap!21852 (toList!10941 List!31350)) )
))
(declare-fun contains!9117 (ListLongMap!21851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5895 (array!91624 array!91622 (_ BitVec 32) (_ BitVec 32) V!54957 V!54957 (_ BitVec 32) Int) ListLongMap!21851)

(assert (=> b!1345006 (= res!892414 (contains!9117 (getCurrentListMap!5895 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345007 () Bool)

(declare-fun e!765430 () Bool)

(assert (=> b!1345007 (= e!765430 (not true))))

(declare-fun lt!595262 () ListLongMap!21851)

(assert (=> b!1345007 (contains!9117 lt!595262 k!1142)))

(declare-datatypes ((Unit!44123 0))(
  ( (Unit!44124) )
))
(declare-fun lt!595261 () Unit!44123)

(declare-fun lt!595263 () V!54957)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!392 ((_ BitVec 64) (_ BitVec 64) V!54957 ListLongMap!21851) Unit!44123)

(assert (=> b!1345007 (= lt!595261 (lemmaInListMapAfterAddingDiffThenInBefore!392 k!1142 (select (arr!44268 _keys!1571) from!1960) lt!595263 lt!595262))))

(declare-fun res!892417 () Bool)

(assert (=> start!113340 (=> (not res!892417) (not e!765427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113340 (= res!892417 (validMask!0 mask!1977))))

(assert (=> start!113340 e!765427))

(declare-fun tp_is_empty!37391 () Bool)

(assert (=> start!113340 tp_is_empty!37391))

(assert (=> start!113340 true))

(declare-fun array_inv!33361 (array!91624) Bool)

(assert (=> start!113340 (array_inv!33361 _keys!1571)))

(declare-fun e!765429 () Bool)

(declare-fun array_inv!33362 (array!91622) Bool)

(assert (=> start!113340 (and (array_inv!33362 _values!1303) e!765429)))

(assert (=> start!113340 tp!109977))

(declare-fun b!1345008 () Bool)

(declare-fun res!892422 () Bool)

(assert (=> b!1345008 (=> (not res!892422) (not e!765427))))

(assert (=> b!1345008 (= res!892422 (and (= (size!44817 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44818 _keys!1571) (size!44817 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345009 () Bool)

(declare-fun res!892419 () Bool)

(assert (=> b!1345009 (=> (not res!892419) (not e!765427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345009 (= res!892419 (validKeyInArray!0 (select (arr!44268 _keys!1571) from!1960)))))

(declare-fun b!1345010 () Bool)

(declare-fun res!892418 () Bool)

(assert (=> b!1345010 (=> (not res!892418) (not e!765427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91624 (_ BitVec 32)) Bool)

(assert (=> b!1345010 (= res!892418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345011 () Bool)

(declare-fun res!892412 () Bool)

(assert (=> b!1345011 (=> (not res!892412) (not e!765427))))

(declare-datatypes ((List!31351 0))(
  ( (Nil!31348) (Cons!31347 (h!32556 (_ BitVec 64)) (t!45899 List!31351)) )
))
(declare-fun arrayNoDuplicates!0 (array!91624 (_ BitVec 32) List!31351) Bool)

(assert (=> b!1345011 (= res!892412 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31348))))

(declare-fun b!1345012 () Bool)

(declare-fun res!892413 () Bool)

(assert (=> b!1345012 (=> (not res!892413) (not e!765427))))

(assert (=> b!1345012 (= res!892413 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44818 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345013 () Bool)

(declare-fun e!765428 () Bool)

(assert (=> b!1345013 (= e!765428 tp_is_empty!37391)))

(declare-fun b!1345014 () Bool)

(declare-fun res!892416 () Bool)

(assert (=> b!1345014 (=> (not res!892416) (not e!765427))))

(assert (=> b!1345014 (= res!892416 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345015 () Bool)

(declare-fun res!892420 () Bool)

(assert (=> b!1345015 (=> (not res!892420) (not e!765430))))

(assert (=> b!1345015 (= res!892420 (not (= k!1142 (select (arr!44268 _keys!1571) from!1960))))))

(declare-fun b!1345016 () Bool)

(declare-fun e!765426 () Bool)

(declare-fun mapRes!57793 () Bool)

(assert (=> b!1345016 (= e!765429 (and e!765426 mapRes!57793))))

(declare-fun condMapEmpty!57793 () Bool)

(declare-fun mapDefault!57793 () ValueCell!17797)

