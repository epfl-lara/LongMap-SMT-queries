; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40046 () Bool)

(assert start!40046)

(declare-fun b_free!10327 () Bool)

(declare-fun b_next!10327 () Bool)

(assert (=> start!40046 (= b_free!10327 (not b_next!10327))))

(declare-fun tp!36509 () Bool)

(declare-fun b_and!18309 () Bool)

(assert (=> start!40046 (= tp!36509 b_and!18309)))

(declare-fun b!437155 () Bool)

(declare-fun res!257869 () Bool)

(declare-fun e!258046 () Bool)

(assert (=> b!437155 (=> (not res!257869) (not e!258046))))

(declare-datatypes ((array!26784 0))(
  ( (array!26785 (arr!12841 (Array (_ BitVec 32) (_ BitVec 64))) (size!13193 (_ BitVec 32))) )
))
(declare-fun lt!201592 () array!26784)

(declare-datatypes ((List!7562 0))(
  ( (Nil!7559) (Cons!7558 (h!8414 (_ BitVec 64)) (t!13310 List!7562)) )
))
(declare-fun arrayNoDuplicates!0 (array!26784 (_ BitVec 32) List!7562) Bool)

(assert (=> b!437155 (= res!257869 (arrayNoDuplicates!0 lt!201592 #b00000000000000000000000000000000 Nil!7559))))

(declare-fun b!437157 () Bool)

(declare-fun res!257875 () Bool)

(declare-fun e!258048 () Bool)

(assert (=> b!437157 (=> (not res!257875) (not e!258048))))

(declare-fun _keys!709 () array!26784)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16411 0))(
  ( (V!16412 (val!5784 Int)) )
))
(declare-datatypes ((ValueCell!5396 0))(
  ( (ValueCellFull!5396 (v!8032 V!16411)) (EmptyCell!5396) )
))
(declare-datatypes ((array!26786 0))(
  ( (array!26787 (arr!12842 (Array (_ BitVec 32) ValueCell!5396)) (size!13194 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26786)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!437157 (= res!257875 (and (= (size!13194 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13193 _keys!709) (size!13194 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18840 () Bool)

(declare-fun mapRes!18840 () Bool)

(declare-fun tp!36510 () Bool)

(declare-fun e!258044 () Bool)

(assert (=> mapNonEmpty!18840 (= mapRes!18840 (and tp!36510 e!258044))))

(declare-fun mapRest!18840 () (Array (_ BitVec 32) ValueCell!5396))

(declare-fun mapKey!18840 () (_ BitVec 32))

(declare-fun mapValue!18840 () ValueCell!5396)

(assert (=> mapNonEmpty!18840 (= (arr!12842 _values!549) (store mapRest!18840 mapKey!18840 mapValue!18840))))

(declare-fun b!437158 () Bool)

(declare-fun res!257870 () Bool)

(assert (=> b!437158 (=> (not res!257870) (not e!258048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26784 (_ BitVec 32)) Bool)

(assert (=> b!437158 (= res!257870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437159 () Bool)

(declare-fun res!257876 () Bool)

(assert (=> b!437159 (=> (not res!257876) (not e!258048))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437159 (= res!257876 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13193 _keys!709))))))

(declare-fun b!437160 () Bool)

(declare-fun res!257868 () Bool)

(assert (=> b!437160 (=> (not res!257868) (not e!258046))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!437160 (= res!257868 (bvsle from!863 i!563))))

(declare-fun b!437161 () Bool)

(declare-fun res!257877 () Bool)

(assert (=> b!437161 (=> (not res!257877) (not e!258048))))

(assert (=> b!437161 (= res!257877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7559))))

(declare-fun b!437162 () Bool)

(declare-fun res!257867 () Bool)

(assert (=> b!437162 (=> (not res!257867) (not e!258048))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437162 (= res!257867 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437163 () Bool)

(declare-fun tp_is_empty!11479 () Bool)

(assert (=> b!437163 (= e!258044 tp_is_empty!11479)))

(declare-fun b!437164 () Bool)

(declare-fun res!257872 () Bool)

(assert (=> b!437164 (=> (not res!257872) (not e!258048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437164 (= res!257872 (validMask!0 mask!1025))))

(declare-fun b!437165 () Bool)

(declare-fun e!258043 () Bool)

(assert (=> b!437165 (= e!258043 tp_is_empty!11479)))

(declare-fun b!437166 () Bool)

(declare-fun e!258049 () Bool)

(assert (=> b!437166 (= e!258049 (and e!258043 mapRes!18840))))

(declare-fun condMapEmpty!18840 () Bool)

(declare-fun mapDefault!18840 () ValueCell!5396)

(assert (=> b!437166 (= condMapEmpty!18840 (= (arr!12842 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5396)) mapDefault!18840)))))

(declare-fun b!437156 () Bool)

(declare-fun res!257873 () Bool)

(assert (=> b!437156 (=> (not res!257873) (not e!258048))))

(assert (=> b!437156 (= res!257873 (or (= (select (arr!12841 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12841 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!257866 () Bool)

(assert (=> start!40046 (=> (not res!257866) (not e!258048))))

(assert (=> start!40046 (= res!257866 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13193 _keys!709))))))

(assert (=> start!40046 e!258048))

(assert (=> start!40046 tp_is_empty!11479))

(assert (=> start!40046 tp!36509))

(assert (=> start!40046 true))

(declare-fun array_inv!9394 (array!26786) Bool)

(assert (=> start!40046 (and (array_inv!9394 _values!549) e!258049)))

(declare-fun array_inv!9395 (array!26784) Bool)

(assert (=> start!40046 (array_inv!9395 _keys!709)))

(declare-fun b!437167 () Bool)

(declare-fun res!257874 () Bool)

(assert (=> b!437167 (=> (not res!257874) (not e!258048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437167 (= res!257874 (validKeyInArray!0 k0!794))))

(declare-fun b!437168 () Bool)

(assert (=> b!437168 (= e!258048 e!258046)))

(declare-fun res!257871 () Bool)

(assert (=> b!437168 (=> (not res!257871) (not e!258046))))

(assert (=> b!437168 (= res!257871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201592 mask!1025))))

(assert (=> b!437168 (= lt!201592 (array!26785 (store (arr!12841 _keys!709) i!563 k0!794) (size!13193 _keys!709)))))

(declare-fun b!437169 () Bool)

(declare-fun e!258045 () Bool)

(assert (=> b!437169 (= e!258046 e!258045)))

(declare-fun res!257865 () Bool)

(assert (=> b!437169 (=> (not res!257865) (not e!258045))))

(assert (=> b!437169 (= res!257865 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16411)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7574 0))(
  ( (tuple2!7575 (_1!3798 (_ BitVec 64)) (_2!3798 V!16411)) )
))
(declare-datatypes ((List!7563 0))(
  ( (Nil!7560) (Cons!7559 (h!8415 tuple2!7574) (t!13311 List!7563)) )
))
(declare-datatypes ((ListLongMap!6489 0))(
  ( (ListLongMap!6490 (toList!3260 List!7563)) )
))
(declare-fun lt!201590 () ListLongMap!6489)

(declare-fun zeroValue!515 () V!16411)

(declare-fun lt!201594 () array!26786)

(declare-fun getCurrentListMapNoExtraKeys!1493 (array!26784 array!26786 (_ BitVec 32) (_ BitVec 32) V!16411 V!16411 (_ BitVec 32) Int) ListLongMap!6489)

(assert (=> b!437169 (= lt!201590 (getCurrentListMapNoExtraKeys!1493 lt!201592 lt!201594 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16411)

(assert (=> b!437169 (= lt!201594 (array!26787 (store (arr!12842 _values!549) i!563 (ValueCellFull!5396 v!412)) (size!13194 _values!549)))))

(declare-fun lt!201593 () ListLongMap!6489)

(assert (=> b!437169 (= lt!201593 (getCurrentListMapNoExtraKeys!1493 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437170 () Bool)

(assert (=> b!437170 (= e!258045 (not true))))

(declare-fun +!1460 (ListLongMap!6489 tuple2!7574) ListLongMap!6489)

(assert (=> b!437170 (= (getCurrentListMapNoExtraKeys!1493 lt!201592 lt!201594 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1460 (getCurrentListMapNoExtraKeys!1493 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7575 k0!794 v!412)))))

(declare-datatypes ((Unit!12995 0))(
  ( (Unit!12996) )
))
(declare-fun lt!201591 () Unit!12995)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!620 (array!26784 array!26786 (_ BitVec 32) (_ BitVec 32) V!16411 V!16411 (_ BitVec 32) (_ BitVec 64) V!16411 (_ BitVec 32) Int) Unit!12995)

(assert (=> b!437170 (= lt!201591 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!620 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18840 () Bool)

(assert (=> mapIsEmpty!18840 mapRes!18840))

(assert (= (and start!40046 res!257866) b!437164))

(assert (= (and b!437164 res!257872) b!437157))

(assert (= (and b!437157 res!257875) b!437158))

(assert (= (and b!437158 res!257870) b!437161))

(assert (= (and b!437161 res!257877) b!437159))

(assert (= (and b!437159 res!257876) b!437167))

(assert (= (and b!437167 res!257874) b!437156))

(assert (= (and b!437156 res!257873) b!437162))

(assert (= (and b!437162 res!257867) b!437168))

(assert (= (and b!437168 res!257871) b!437155))

(assert (= (and b!437155 res!257869) b!437160))

(assert (= (and b!437160 res!257868) b!437169))

(assert (= (and b!437169 res!257865) b!437170))

(assert (= (and b!437166 condMapEmpty!18840) mapIsEmpty!18840))

(assert (= (and b!437166 (not condMapEmpty!18840)) mapNonEmpty!18840))

(get-info :version)

(assert (= (and mapNonEmpty!18840 ((_ is ValueCellFull!5396) mapValue!18840)) b!437163))

(assert (= (and b!437166 ((_ is ValueCellFull!5396) mapDefault!18840)) b!437165))

(assert (= start!40046 b!437166))

(declare-fun m!425141 () Bool)

(assert (=> b!437167 m!425141))

(declare-fun m!425143 () Bool)

(assert (=> b!437155 m!425143))

(declare-fun m!425145 () Bool)

(assert (=> b!437170 m!425145))

(declare-fun m!425147 () Bool)

(assert (=> b!437170 m!425147))

(assert (=> b!437170 m!425147))

(declare-fun m!425149 () Bool)

(assert (=> b!437170 m!425149))

(declare-fun m!425151 () Bool)

(assert (=> b!437170 m!425151))

(declare-fun m!425153 () Bool)

(assert (=> mapNonEmpty!18840 m!425153))

(declare-fun m!425155 () Bool)

(assert (=> start!40046 m!425155))

(declare-fun m!425157 () Bool)

(assert (=> start!40046 m!425157))

(declare-fun m!425159 () Bool)

(assert (=> b!437158 m!425159))

(declare-fun m!425161 () Bool)

(assert (=> b!437168 m!425161))

(declare-fun m!425163 () Bool)

(assert (=> b!437168 m!425163))

(declare-fun m!425165 () Bool)

(assert (=> b!437164 m!425165))

(declare-fun m!425167 () Bool)

(assert (=> b!437161 m!425167))

(declare-fun m!425169 () Bool)

(assert (=> b!437156 m!425169))

(declare-fun m!425171 () Bool)

(assert (=> b!437162 m!425171))

(declare-fun m!425173 () Bool)

(assert (=> b!437169 m!425173))

(declare-fun m!425175 () Bool)

(assert (=> b!437169 m!425175))

(declare-fun m!425177 () Bool)

(assert (=> b!437169 m!425177))

(check-sat (not b!437170) (not b_next!10327) (not start!40046) (not b!437169) (not b!437164) (not b!437162) (not b!437158) (not mapNonEmpty!18840) (not b!437168) (not b!437155) b_and!18309 (not b!437167) tp_is_empty!11479 (not b!437161))
(check-sat b_and!18309 (not b_next!10327))
