; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82644 () Bool)

(assert start!82644)

(declare-fun b_free!18777 () Bool)

(declare-fun b_next!18777 () Bool)

(assert (=> start!82644 (= b_free!18777 (not b_next!18777))))

(declare-fun tp!65451 () Bool)

(declare-fun b_and!30265 () Bool)

(assert (=> start!82644 (= tp!65451 b_and!30265)))

(declare-fun b!963393 () Bool)

(declare-fun res!644763 () Bool)

(declare-fun e!543215 () Bool)

(assert (=> b!963393 (=> (not res!644763) (not e!543215))))

(declare-datatypes ((array!59253 0))(
  ( (array!59254 (arr!28495 (Array (_ BitVec 32) (_ BitVec 64))) (size!28974 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59253)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59253 (_ BitVec 32)) Bool)

(assert (=> b!963393 (= res!644763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644761 () Bool)

(assert (=> start!82644 (=> (not res!644761) (not e!543215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82644 (= res!644761 (validMask!0 mask!2110))))

(assert (=> start!82644 e!543215))

(assert (=> start!82644 true))

(declare-datatypes ((V!33755 0))(
  ( (V!33756 (val!10840 Int)) )
))
(declare-datatypes ((ValueCell!10308 0))(
  ( (ValueCellFull!10308 (v!13398 V!33755)) (EmptyCell!10308) )
))
(declare-datatypes ((array!59255 0))(
  ( (array!59256 (arr!28496 (Array (_ BitVec 32) ValueCell!10308)) (size!28975 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59255)

(declare-fun e!543211 () Bool)

(declare-fun array_inv!22079 (array!59255) Bool)

(assert (=> start!82644 (and (array_inv!22079 _values!1400) e!543211)))

(declare-fun array_inv!22080 (array!59253) Bool)

(assert (=> start!82644 (array_inv!22080 _keys!1686)))

(assert (=> start!82644 tp!65451))

(declare-fun tp_is_empty!21579 () Bool)

(assert (=> start!82644 tp_is_empty!21579))

(declare-fun b!963394 () Bool)

(declare-fun res!644765 () Bool)

(assert (=> b!963394 (=> (not res!644765) (not e!543215))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963394 (= res!644765 (validKeyInArray!0 (select (arr!28495 _keys!1686) i!803)))))

(declare-fun b!963395 () Bool)

(declare-fun res!644762 () Bool)

(assert (=> b!963395 (=> (not res!644762) (not e!543215))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33755)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33755)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13926 0))(
  ( (tuple2!13927 (_1!6974 (_ BitVec 64)) (_2!6974 V!33755)) )
))
(declare-datatypes ((List!19777 0))(
  ( (Nil!19774) (Cons!19773 (h!20935 tuple2!13926) (t!28140 List!19777)) )
))
(declare-datatypes ((ListLongMap!12623 0))(
  ( (ListLongMap!12624 (toList!6327 List!19777)) )
))
(declare-fun contains!5430 (ListLongMap!12623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3560 (array!59253 array!59255 (_ BitVec 32) (_ BitVec 32) V!33755 V!33755 (_ BitVec 32) Int) ListLongMap!12623)

(assert (=> b!963395 (= res!644762 (contains!5430 (getCurrentListMap!3560 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28495 _keys!1686) i!803)))))

(declare-fun b!963396 () Bool)

(declare-fun res!644764 () Bool)

(assert (=> b!963396 (=> (not res!644764) (not e!543215))))

(declare-datatypes ((List!19778 0))(
  ( (Nil!19775) (Cons!19774 (h!20936 (_ BitVec 64)) (t!28141 List!19778)) )
))
(declare-fun arrayNoDuplicates!0 (array!59253 (_ BitVec 32) List!19778) Bool)

(assert (=> b!963396 (= res!644764 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19775))))

(declare-fun mapNonEmpty!34363 () Bool)

(declare-fun mapRes!34363 () Bool)

(declare-fun tp!65450 () Bool)

(declare-fun e!543214 () Bool)

(assert (=> mapNonEmpty!34363 (= mapRes!34363 (and tp!65450 e!543214))))

(declare-fun mapKey!34363 () (_ BitVec 32))

(declare-fun mapValue!34363 () ValueCell!10308)

(declare-fun mapRest!34363 () (Array (_ BitVec 32) ValueCell!10308))

(assert (=> mapNonEmpty!34363 (= (arr!28496 _values!1400) (store mapRest!34363 mapKey!34363 mapValue!34363))))

(declare-fun b!963397 () Bool)

(assert (=> b!963397 (= e!543214 tp_is_empty!21579)))

(declare-fun b!963398 () Bool)

(declare-fun res!644760 () Bool)

(assert (=> b!963398 (=> (not res!644760) (not e!543215))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963398 (= res!644760 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963399 () Bool)

(declare-fun res!644767 () Bool)

(assert (=> b!963399 (=> (not res!644767) (not e!543215))))

(assert (=> b!963399 (= res!644767 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28974 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28974 _keys!1686))))))

(declare-fun b!963400 () Bool)

(declare-fun e!543212 () Bool)

(assert (=> b!963400 (= e!543211 (and e!543212 mapRes!34363))))

(declare-fun condMapEmpty!34363 () Bool)

(declare-fun mapDefault!34363 () ValueCell!10308)

(assert (=> b!963400 (= condMapEmpty!34363 (= (arr!28496 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10308)) mapDefault!34363)))))

(declare-fun mapIsEmpty!34363 () Bool)

(assert (=> mapIsEmpty!34363 mapRes!34363))

(declare-fun b!963401 () Bool)

(assert (=> b!963401 (= e!543215 (not true))))

(assert (=> b!963401 (contains!5430 (getCurrentListMap!3560 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28495 _keys!1686) i!803))))

(declare-datatypes ((Unit!32237 0))(
  ( (Unit!32238) )
))
(declare-fun lt!430969 () Unit!32237)

(declare-fun lemmaInListMapFromThenInFromMinusOne!13 (array!59253 array!59255 (_ BitVec 32) (_ BitVec 32) V!33755 V!33755 (_ BitVec 32) (_ BitVec 32) Int) Unit!32237)

(assert (=> b!963401 (= lt!430969 (lemmaInListMapFromThenInFromMinusOne!13 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963402 () Bool)

(assert (=> b!963402 (= e!543212 tp_is_empty!21579)))

(declare-fun b!963403 () Bool)

(declare-fun res!644766 () Bool)

(assert (=> b!963403 (=> (not res!644766) (not e!543215))))

(assert (=> b!963403 (= res!644766 (and (= (size!28975 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28974 _keys!1686) (size!28975 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82644 res!644761) b!963403))

(assert (= (and b!963403 res!644766) b!963393))

(assert (= (and b!963393 res!644763) b!963396))

(assert (= (and b!963396 res!644764) b!963399))

(assert (= (and b!963399 res!644767) b!963394))

(assert (= (and b!963394 res!644765) b!963395))

(assert (= (and b!963395 res!644762) b!963398))

(assert (= (and b!963398 res!644760) b!963401))

(assert (= (and b!963400 condMapEmpty!34363) mapIsEmpty!34363))

(assert (= (and b!963400 (not condMapEmpty!34363)) mapNonEmpty!34363))

(get-info :version)

(assert (= (and mapNonEmpty!34363 ((_ is ValueCellFull!10308) mapValue!34363)) b!963397))

(assert (= (and b!963400 ((_ is ValueCellFull!10308) mapDefault!34363)) b!963402))

(assert (= start!82644 b!963400))

(declare-fun m!892823 () Bool)

(assert (=> mapNonEmpty!34363 m!892823))

(declare-fun m!892825 () Bool)

(assert (=> b!963395 m!892825))

(declare-fun m!892827 () Bool)

(assert (=> b!963395 m!892827))

(assert (=> b!963395 m!892825))

(assert (=> b!963395 m!892827))

(declare-fun m!892829 () Bool)

(assert (=> b!963395 m!892829))

(declare-fun m!892831 () Bool)

(assert (=> b!963396 m!892831))

(declare-fun m!892833 () Bool)

(assert (=> b!963401 m!892833))

(assert (=> b!963401 m!892827))

(assert (=> b!963401 m!892833))

(assert (=> b!963401 m!892827))

(declare-fun m!892835 () Bool)

(assert (=> b!963401 m!892835))

(declare-fun m!892837 () Bool)

(assert (=> b!963401 m!892837))

(declare-fun m!892839 () Bool)

(assert (=> start!82644 m!892839))

(declare-fun m!892841 () Bool)

(assert (=> start!82644 m!892841))

(declare-fun m!892843 () Bool)

(assert (=> start!82644 m!892843))

(declare-fun m!892845 () Bool)

(assert (=> b!963393 m!892845))

(assert (=> b!963394 m!892827))

(assert (=> b!963394 m!892827))

(declare-fun m!892847 () Bool)

(assert (=> b!963394 m!892847))

(check-sat (not b!963401) (not b!963394) (not b!963396) (not mapNonEmpty!34363) tp_is_empty!21579 (not start!82644) (not b!963395) b_and!30265 (not b_next!18777) (not b!963393))
(check-sat b_and!30265 (not b_next!18777))
