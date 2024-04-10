; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133866 () Bool)

(assert start!133866)

(declare-fun b_free!32127 () Bool)

(declare-fun b_next!32127 () Bool)

(assert (=> start!133866 (= b_free!32127 (not b_next!32127))))

(declare-fun tp!113677 () Bool)

(declare-fun b_and!51697 () Bool)

(assert (=> start!133866 (= tp!113677 b_and!51697)))

(declare-fun b!1565025 () Bool)

(declare-fun res!1069877 () Bool)

(declare-fun e!872316 () Bool)

(assert (=> b!1565025 (=> (not res!1069877) (not e!872316))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104490 0))(
  ( (array!104491 (arr!50434 (Array (_ BitVec 32) (_ BitVec 64))) (size!50984 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104490)

(declare-datatypes ((V!60075 0))(
  ( (V!60076 (val!19534 Int)) )
))
(declare-datatypes ((ValueCell!18420 0))(
  ( (ValueCellFull!18420 (v!22288 V!60075)) (EmptyCell!18420) )
))
(declare-datatypes ((array!104492 0))(
  ( (array!104493 (arr!50435 (Array (_ BitVec 32) ValueCell!18420)) (size!50985 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104492)

(assert (=> b!1565025 (= res!1069877 (and (= (size!50985 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50984 _keys!637) (size!50985 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565026 () Bool)

(declare-fun e!872319 () Bool)

(declare-fun tp_is_empty!38901 () Bool)

(assert (=> b!1565026 (= e!872319 tp_is_empty!38901)))

(declare-fun b!1565027 () Bool)

(declare-fun e!872318 () Bool)

(assert (=> b!1565027 (= e!872318 tp_is_empty!38901)))

(declare-fun mapIsEmpty!59737 () Bool)

(declare-fun mapRes!59737 () Bool)

(assert (=> mapIsEmpty!59737 mapRes!59737))

(declare-fun b!1565028 () Bool)

(declare-fun res!1069874 () Bool)

(assert (=> b!1565028 (=> (not res!1069874) (not e!872316))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565028 (= res!1069874 (validKeyInArray!0 (select (arr!50434 _keys!637) from!782)))))

(declare-fun b!1565029 () Bool)

(declare-fun res!1069875 () Bool)

(assert (=> b!1565029 (=> (not res!1069875) (not e!872316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104490 (_ BitVec 32)) Bool)

(assert (=> b!1565029 (= res!1069875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565030 () Bool)

(declare-fun e!872320 () Bool)

(assert (=> b!1565030 (= e!872320 (and e!872318 mapRes!59737))))

(declare-fun condMapEmpty!59737 () Bool)

(declare-fun mapDefault!59737 () ValueCell!18420)

(assert (=> b!1565030 (= condMapEmpty!59737 (= (arr!50435 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18420)) mapDefault!59737)))))

(declare-fun res!1069879 () Bool)

(assert (=> start!133866 (=> (not res!1069879) (not e!872316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133866 (= res!1069879 (validMask!0 mask!947))))

(assert (=> start!133866 e!872316))

(assert (=> start!133866 tp!113677))

(assert (=> start!133866 tp_is_empty!38901))

(assert (=> start!133866 true))

(declare-fun array_inv!39193 (array!104490) Bool)

(assert (=> start!133866 (array_inv!39193 _keys!637)))

(declare-fun array_inv!39194 (array!104492) Bool)

(assert (=> start!133866 (and (array_inv!39194 _values!487) e!872320)))

(declare-fun b!1565031 () Bool)

(assert (=> b!1565031 (= e!872316 (bvsge from!782 (size!50985 _values!487)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60075)

(declare-fun minValue!453 () V!60075)

(declare-datatypes ((tuple2!25202 0))(
  ( (tuple2!25203 (_1!12612 (_ BitVec 64)) (_2!12612 V!60075)) )
))
(declare-datatypes ((List!36589 0))(
  ( (Nil!36586) (Cons!36585 (h!38031 tuple2!25202) (t!51436 List!36589)) )
))
(declare-datatypes ((ListLongMap!22637 0))(
  ( (ListLongMap!22638 (toList!11334 List!36589)) )
))
(declare-fun lt!672131 () ListLongMap!22637)

(declare-fun getCurrentListMapNoExtraKeys!6699 (array!104490 array!104492 (_ BitVec 32) (_ BitVec 32) V!60075 V!60075 (_ BitVec 32) Int) ListLongMap!22637)

(assert (=> b!1565031 (= lt!672131 (getCurrentListMapNoExtraKeys!6699 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565032 () Bool)

(declare-fun res!1069876 () Bool)

(assert (=> b!1565032 (=> (not res!1069876) (not e!872316))))

(declare-datatypes ((List!36590 0))(
  ( (Nil!36587) (Cons!36586 (h!38032 (_ BitVec 64)) (t!51437 List!36590)) )
))
(declare-fun arrayNoDuplicates!0 (array!104490 (_ BitVec 32) List!36590) Bool)

(assert (=> b!1565032 (= res!1069876 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36587))))

(declare-fun b!1565033 () Bool)

(declare-fun res!1069878 () Bool)

(assert (=> b!1565033 (=> (not res!1069878) (not e!872316))))

(assert (=> b!1565033 (= res!1069878 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50984 _keys!637)) (bvslt from!782 (size!50984 _keys!637))))))

(declare-fun mapNonEmpty!59737 () Bool)

(declare-fun tp!113676 () Bool)

(assert (=> mapNonEmpty!59737 (= mapRes!59737 (and tp!113676 e!872319))))

(declare-fun mapKey!59737 () (_ BitVec 32))

(declare-fun mapValue!59737 () ValueCell!18420)

(declare-fun mapRest!59737 () (Array (_ BitVec 32) ValueCell!18420))

(assert (=> mapNonEmpty!59737 (= (arr!50435 _values!487) (store mapRest!59737 mapKey!59737 mapValue!59737))))

(assert (= (and start!133866 res!1069879) b!1565025))

(assert (= (and b!1565025 res!1069877) b!1565029))

(assert (= (and b!1565029 res!1069875) b!1565032))

(assert (= (and b!1565032 res!1069876) b!1565033))

(assert (= (and b!1565033 res!1069878) b!1565028))

(assert (= (and b!1565028 res!1069874) b!1565031))

(assert (= (and b!1565030 condMapEmpty!59737) mapIsEmpty!59737))

(assert (= (and b!1565030 (not condMapEmpty!59737)) mapNonEmpty!59737))

(get-info :version)

(assert (= (and mapNonEmpty!59737 ((_ is ValueCellFull!18420) mapValue!59737)) b!1565026))

(assert (= (and b!1565030 ((_ is ValueCellFull!18420) mapDefault!59737)) b!1565027))

(assert (= start!133866 b!1565030))

(declare-fun m!1440019 () Bool)

(assert (=> b!1565029 m!1440019))

(declare-fun m!1440021 () Bool)

(assert (=> b!1565028 m!1440021))

(assert (=> b!1565028 m!1440021))

(declare-fun m!1440023 () Bool)

(assert (=> b!1565028 m!1440023))

(declare-fun m!1440025 () Bool)

(assert (=> mapNonEmpty!59737 m!1440025))

(declare-fun m!1440027 () Bool)

(assert (=> b!1565031 m!1440027))

(declare-fun m!1440029 () Bool)

(assert (=> start!133866 m!1440029))

(declare-fun m!1440031 () Bool)

(assert (=> start!133866 m!1440031))

(declare-fun m!1440033 () Bool)

(assert (=> start!133866 m!1440033))

(declare-fun m!1440035 () Bool)

(assert (=> b!1565032 m!1440035))

(check-sat (not b!1565029) (not b!1565031) (not b!1565028) b_and!51697 (not b_next!32127) (not start!133866) (not mapNonEmpty!59737) tp_is_empty!38901 (not b!1565032))
(check-sat b_and!51697 (not b_next!32127))
