; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82726 () Bool)

(assert start!82726)

(declare-fun b_free!18691 () Bool)

(declare-fun b_next!18691 () Bool)

(assert (=> start!82726 (= b_free!18691 (not b_next!18691))))

(declare-fun tp!65193 () Bool)

(declare-fun b_and!30189 () Bool)

(assert (=> start!82726 (= tp!65193 b_and!30189)))

(declare-fun b!963017 () Bool)

(declare-fun res!644214 () Bool)

(declare-fun e!543148 () Bool)

(assert (=> b!963017 (=> (not res!644214) (not e!543148))))

(declare-datatypes ((array!59102 0))(
  ( (array!59103 (arr!28415 (Array (_ BitVec 32) (_ BitVec 64))) (size!28895 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59102)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963017 (= res!644214 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28895 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28895 _keys!1686))))))

(declare-fun b!963018 () Bool)

(declare-fun res!644213 () Bool)

(assert (=> b!963018 (=> (not res!644213) (not e!543148))))

(declare-datatypes ((V!33641 0))(
  ( (V!33642 (val!10797 Int)) )
))
(declare-datatypes ((ValueCell!10265 0))(
  ( (ValueCellFull!10265 (v!13352 V!33641)) (EmptyCell!10265) )
))
(declare-datatypes ((array!59104 0))(
  ( (array!59105 (arr!28416 (Array (_ BitVec 32) ValueCell!10265)) (size!28896 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59104)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!963018 (= res!644213 (and (= (size!28896 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28895 _keys!1686) (size!28896 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963019 () Bool)

(declare-fun e!543149 () Bool)

(declare-fun e!543152 () Bool)

(declare-fun mapRes!34234 () Bool)

(assert (=> b!963019 (= e!543149 (and e!543152 mapRes!34234))))

(declare-fun condMapEmpty!34234 () Bool)

(declare-fun mapDefault!34234 () ValueCell!10265)

(assert (=> b!963019 (= condMapEmpty!34234 (= (arr!28416 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10265)) mapDefault!34234)))))

(declare-fun res!644212 () Bool)

(assert (=> start!82726 (=> (not res!644212) (not e!543148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82726 (= res!644212 (validMask!0 mask!2110))))

(assert (=> start!82726 e!543148))

(assert (=> start!82726 true))

(declare-fun array_inv!22089 (array!59104) Bool)

(assert (=> start!82726 (and (array_inv!22089 _values!1400) e!543149)))

(declare-fun array_inv!22090 (array!59102) Bool)

(assert (=> start!82726 (array_inv!22090 _keys!1686)))

(assert (=> start!82726 tp!65193))

(declare-fun tp_is_empty!21493 () Bool)

(assert (=> start!82726 tp_is_empty!21493))

(declare-fun mapNonEmpty!34234 () Bool)

(declare-fun tp!65194 () Bool)

(declare-fun e!543150 () Bool)

(assert (=> mapNonEmpty!34234 (= mapRes!34234 (and tp!65194 e!543150))))

(declare-fun mapKey!34234 () (_ BitVec 32))

(declare-fun mapValue!34234 () ValueCell!10265)

(declare-fun mapRest!34234 () (Array (_ BitVec 32) ValueCell!10265))

(assert (=> mapNonEmpty!34234 (= (arr!28416 _values!1400) (store mapRest!34234 mapKey!34234 mapValue!34234))))

(declare-fun b!963020 () Bool)

(declare-fun res!644216 () Bool)

(assert (=> b!963020 (=> (not res!644216) (not e!543148))))

(declare-datatypes ((List!19698 0))(
  ( (Nil!19695) (Cons!19694 (h!20862 (_ BitVec 64)) (t!28053 List!19698)) )
))
(declare-fun arrayNoDuplicates!0 (array!59102 (_ BitVec 32) List!19698) Bool)

(assert (=> b!963020 (= res!644216 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19695))))

(declare-fun b!963021 () Bool)

(assert (=> b!963021 (= e!543150 tp_is_empty!21493)))

(declare-fun b!963022 () Bool)

(assert (=> b!963022 (= e!543152 tp_is_empty!21493)))

(declare-fun b!963023 () Bool)

(declare-fun res!644217 () Bool)

(assert (=> b!963023 (=> (not res!644217) (not e!543148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963023 (= res!644217 (validKeyInArray!0 (select (arr!28415 _keys!1686) i!803)))))

(declare-fun b!963024 () Bool)

(declare-fun res!644215 () Bool)

(assert (=> b!963024 (=> (not res!644215) (not e!543148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59102 (_ BitVec 32)) Bool)

(assert (=> b!963024 (= res!644215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34234 () Bool)

(assert (=> mapIsEmpty!34234 mapRes!34234))

(declare-fun b!963025 () Bool)

(assert (=> b!963025 (= e!543148 false)))

(declare-fun minValue!1342 () V!33641)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431201 () Bool)

(declare-fun zeroValue!1342 () V!33641)

(declare-datatypes ((tuple2!13846 0))(
  ( (tuple2!13847 (_1!6934 (_ BitVec 64)) (_2!6934 V!33641)) )
))
(declare-datatypes ((List!19699 0))(
  ( (Nil!19696) (Cons!19695 (h!20863 tuple2!13846) (t!28054 List!19699)) )
))
(declare-datatypes ((ListLongMap!12545 0))(
  ( (ListLongMap!12546 (toList!6288 List!19699)) )
))
(declare-fun contains!5403 (ListLongMap!12545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3521 (array!59102 array!59104 (_ BitVec 32) (_ BitVec 32) V!33641 V!33641 (_ BitVec 32) Int) ListLongMap!12545)

(assert (=> b!963025 (= lt!431201 (contains!5403 (getCurrentListMap!3521 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28415 _keys!1686) i!803)))))

(assert (= (and start!82726 res!644212) b!963018))

(assert (= (and b!963018 res!644213) b!963024))

(assert (= (and b!963024 res!644215) b!963020))

(assert (= (and b!963020 res!644216) b!963017))

(assert (= (and b!963017 res!644214) b!963023))

(assert (= (and b!963023 res!644217) b!963025))

(assert (= (and b!963019 condMapEmpty!34234) mapIsEmpty!34234))

(assert (= (and b!963019 (not condMapEmpty!34234)) mapNonEmpty!34234))

(get-info :version)

(assert (= (and mapNonEmpty!34234 ((_ is ValueCellFull!10265) mapValue!34234)) b!963021))

(assert (= (and b!963019 ((_ is ValueCellFull!10265) mapDefault!34234)) b!963022))

(assert (= start!82726 b!963019))

(declare-fun m!893143 () Bool)

(assert (=> b!963024 m!893143))

(declare-fun m!893145 () Bool)

(assert (=> b!963020 m!893145))

(declare-fun m!893147 () Bool)

(assert (=> start!82726 m!893147))

(declare-fun m!893149 () Bool)

(assert (=> start!82726 m!893149))

(declare-fun m!893151 () Bool)

(assert (=> start!82726 m!893151))

(declare-fun m!893153 () Bool)

(assert (=> mapNonEmpty!34234 m!893153))

(declare-fun m!893155 () Bool)

(assert (=> b!963023 m!893155))

(assert (=> b!963023 m!893155))

(declare-fun m!893157 () Bool)

(assert (=> b!963023 m!893157))

(declare-fun m!893159 () Bool)

(assert (=> b!963025 m!893159))

(assert (=> b!963025 m!893155))

(assert (=> b!963025 m!893159))

(assert (=> b!963025 m!893155))

(declare-fun m!893161 () Bool)

(assert (=> b!963025 m!893161))

(check-sat (not b!963023) tp_is_empty!21493 (not b_next!18691) (not b!963024) (not start!82726) (not b!963020) (not b!963025) b_and!30189 (not mapNonEmpty!34234))
(check-sat b_and!30189 (not b_next!18691))
