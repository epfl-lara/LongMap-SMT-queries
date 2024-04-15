; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40166 () Bool)

(assert start!40166)

(declare-fun b_free!10447 () Bool)

(declare-fun b_next!10447 () Bool)

(assert (=> start!40166 (= b_free!10447 (not b_next!10447))))

(declare-fun tp!36870 () Bool)

(declare-fun b_and!18389 () Bool)

(assert (=> start!40166 (= tp!36870 b_and!18389)))

(declare-fun b!439813 () Bool)

(declare-fun res!260086 () Bool)

(declare-fun e!259166 () Bool)

(assert (=> b!439813 (=> (not res!260086) (not e!259166))))

(declare-datatypes ((array!27015 0))(
  ( (array!27016 (arr!12957 (Array (_ BitVec 32) (_ BitVec 64))) (size!13310 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27015)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27015 (_ BitVec 32)) Bool)

(assert (=> b!439813 (= res!260086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19020 () Bool)

(declare-fun mapRes!19020 () Bool)

(assert (=> mapIsEmpty!19020 mapRes!19020))

(declare-fun b!439814 () Bool)

(declare-fun res!260090 () Bool)

(assert (=> b!439814 (=> (not res!260090) (not e!259166))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439814 (= res!260090 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13310 _keys!709))))))

(declare-fun b!439815 () Bool)

(declare-fun res!260091 () Bool)

(assert (=> b!439815 (=> (not res!260091) (not e!259166))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16571 0))(
  ( (V!16572 (val!5844 Int)) )
))
(declare-datatypes ((ValueCell!5456 0))(
  ( (ValueCellFull!5456 (v!8085 V!16571)) (EmptyCell!5456) )
))
(declare-datatypes ((array!27017 0))(
  ( (array!27018 (arr!12958 (Array (_ BitVec 32) ValueCell!5456)) (size!13311 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27017)

(assert (=> b!439815 (= res!260091 (and (= (size!13311 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13310 _keys!709) (size!13311 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439816 () Bool)

(declare-fun e!259161 () Bool)

(declare-fun tp_is_empty!11599 () Bool)

(assert (=> b!439816 (= e!259161 tp_is_empty!11599)))

(declare-fun b!439817 () Bool)

(declare-fun res!260082 () Bool)

(assert (=> b!439817 (=> (not res!260082) (not e!259166))))

(declare-datatypes ((List!7766 0))(
  ( (Nil!7763) (Cons!7762 (h!8618 (_ BitVec 64)) (t!13513 List!7766)) )
))
(declare-fun arrayNoDuplicates!0 (array!27015 (_ BitVec 32) List!7766) Bool)

(assert (=> b!439817 (= res!260082 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7763))))

(declare-fun b!439818 () Bool)

(declare-fun e!259164 () Bool)

(declare-fun e!259163 () Bool)

(assert (=> b!439818 (= e!259164 e!259163)))

(declare-fun res!260089 () Bool)

(assert (=> b!439818 (=> (not res!260089) (not e!259163))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!439818 (= res!260089 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16571)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7778 0))(
  ( (tuple2!7779 (_1!3900 (_ BitVec 64)) (_2!3900 V!16571)) )
))
(declare-datatypes ((List!7767 0))(
  ( (Nil!7764) (Cons!7763 (h!8619 tuple2!7778) (t!13514 List!7767)) )
))
(declare-datatypes ((ListLongMap!6681 0))(
  ( (ListLongMap!6682 (toList!3356 List!7767)) )
))
(declare-fun lt!202239 () ListLongMap!6681)

(declare-fun zeroValue!515 () V!16571)

(declare-fun lt!202241 () array!27015)

(declare-fun lt!202240 () array!27017)

(declare-fun getCurrentListMapNoExtraKeys!1555 (array!27015 array!27017 (_ BitVec 32) (_ BitVec 32) V!16571 V!16571 (_ BitVec 32) Int) ListLongMap!6681)

(assert (=> b!439818 (= lt!202239 (getCurrentListMapNoExtraKeys!1555 lt!202241 lt!202240 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16571)

(assert (=> b!439818 (= lt!202240 (array!27018 (store (arr!12958 _values!549) i!563 (ValueCellFull!5456 v!412)) (size!13311 _values!549)))))

(declare-fun lt!202237 () ListLongMap!6681)

(assert (=> b!439818 (= lt!202237 (getCurrentListMapNoExtraKeys!1555 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439819 () Bool)

(declare-fun res!260081 () Bool)

(assert (=> b!439819 (=> (not res!260081) (not e!259166))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439819 (= res!260081 (validKeyInArray!0 k0!794))))

(declare-fun b!439820 () Bool)

(declare-fun res!260088 () Bool)

(assert (=> b!439820 (=> (not res!260088) (not e!259164))))

(assert (=> b!439820 (= res!260088 (arrayNoDuplicates!0 lt!202241 #b00000000000000000000000000000000 Nil!7763))))

(declare-fun b!439821 () Bool)

(declare-fun res!260083 () Bool)

(assert (=> b!439821 (=> (not res!260083) (not e!259166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439821 (= res!260083 (validMask!0 mask!1025))))

(declare-fun b!439822 () Bool)

(assert (=> b!439822 (= e!259163 (not true))))

(declare-fun +!1517 (ListLongMap!6681 tuple2!7778) ListLongMap!6681)

(assert (=> b!439822 (= (getCurrentListMapNoExtraKeys!1555 lt!202241 lt!202240 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1517 (getCurrentListMapNoExtraKeys!1555 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7779 k0!794 v!412)))))

(declare-datatypes ((Unit!13051 0))(
  ( (Unit!13052) )
))
(declare-fun lt!202238 () Unit!13051)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!655 (array!27015 array!27017 (_ BitVec 32) (_ BitVec 32) V!16571 V!16571 (_ BitVec 32) (_ BitVec 64) V!16571 (_ BitVec 32) Int) Unit!13051)

(assert (=> b!439822 (= lt!202238 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439823 () Bool)

(assert (=> b!439823 (= e!259166 e!259164)))

(declare-fun res!260085 () Bool)

(assert (=> b!439823 (=> (not res!260085) (not e!259164))))

(assert (=> b!439823 (= res!260085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202241 mask!1025))))

(assert (=> b!439823 (= lt!202241 (array!27016 (store (arr!12957 _keys!709) i!563 k0!794) (size!13310 _keys!709)))))

(declare-fun b!439824 () Bool)

(declare-fun res!260084 () Bool)

(assert (=> b!439824 (=> (not res!260084) (not e!259164))))

(assert (=> b!439824 (= res!260084 (bvsle from!863 i!563))))

(declare-fun b!439825 () Bool)

(declare-fun res!260087 () Bool)

(assert (=> b!439825 (=> (not res!260087) (not e!259166))))

(assert (=> b!439825 (= res!260087 (or (= (select (arr!12957 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12957 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!260080 () Bool)

(assert (=> start!40166 (=> (not res!260080) (not e!259166))))

(assert (=> start!40166 (= res!260080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13310 _keys!709))))))

(assert (=> start!40166 e!259166))

(assert (=> start!40166 tp_is_empty!11599))

(assert (=> start!40166 tp!36870))

(assert (=> start!40166 true))

(declare-fun e!259167 () Bool)

(declare-fun array_inv!9454 (array!27017) Bool)

(assert (=> start!40166 (and (array_inv!9454 _values!549) e!259167)))

(declare-fun array_inv!9455 (array!27015) Bool)

(assert (=> start!40166 (array_inv!9455 _keys!709)))

(declare-fun mapNonEmpty!19020 () Bool)

(declare-fun tp!36869 () Bool)

(declare-fun e!259162 () Bool)

(assert (=> mapNonEmpty!19020 (= mapRes!19020 (and tp!36869 e!259162))))

(declare-fun mapRest!19020 () (Array (_ BitVec 32) ValueCell!5456))

(declare-fun mapValue!19020 () ValueCell!5456)

(declare-fun mapKey!19020 () (_ BitVec 32))

(assert (=> mapNonEmpty!19020 (= (arr!12958 _values!549) (store mapRest!19020 mapKey!19020 mapValue!19020))))

(declare-fun b!439826 () Bool)

(declare-fun res!260079 () Bool)

(assert (=> b!439826 (=> (not res!260079) (not e!259166))))

(declare-fun arrayContainsKey!0 (array!27015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439826 (= res!260079 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439827 () Bool)

(assert (=> b!439827 (= e!259162 tp_is_empty!11599)))

(declare-fun b!439828 () Bool)

(assert (=> b!439828 (= e!259167 (and e!259161 mapRes!19020))))

(declare-fun condMapEmpty!19020 () Bool)

(declare-fun mapDefault!19020 () ValueCell!5456)

(assert (=> b!439828 (= condMapEmpty!19020 (= (arr!12958 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5456)) mapDefault!19020)))))

(assert (= (and start!40166 res!260080) b!439821))

(assert (= (and b!439821 res!260083) b!439815))

(assert (= (and b!439815 res!260091) b!439813))

(assert (= (and b!439813 res!260086) b!439817))

(assert (= (and b!439817 res!260082) b!439814))

(assert (= (and b!439814 res!260090) b!439819))

(assert (= (and b!439819 res!260081) b!439825))

(assert (= (and b!439825 res!260087) b!439826))

(assert (= (and b!439826 res!260079) b!439823))

(assert (= (and b!439823 res!260085) b!439820))

(assert (= (and b!439820 res!260088) b!439824))

(assert (= (and b!439824 res!260084) b!439818))

(assert (= (and b!439818 res!260089) b!439822))

(assert (= (and b!439828 condMapEmpty!19020) mapIsEmpty!19020))

(assert (= (and b!439828 (not condMapEmpty!19020)) mapNonEmpty!19020))

(get-info :version)

(assert (= (and mapNonEmpty!19020 ((_ is ValueCellFull!5456) mapValue!19020)) b!439827))

(assert (= (and b!439828 ((_ is ValueCellFull!5456) mapDefault!19020)) b!439816))

(assert (= start!40166 b!439828))

(declare-fun m!426471 () Bool)

(assert (=> mapNonEmpty!19020 m!426471))

(declare-fun m!426473 () Bool)

(assert (=> b!439813 m!426473))

(declare-fun m!426475 () Bool)

(assert (=> b!439819 m!426475))

(declare-fun m!426477 () Bool)

(assert (=> b!439817 m!426477))

(declare-fun m!426479 () Bool)

(assert (=> start!40166 m!426479))

(declare-fun m!426481 () Bool)

(assert (=> start!40166 m!426481))

(declare-fun m!426483 () Bool)

(assert (=> b!439818 m!426483))

(declare-fun m!426485 () Bool)

(assert (=> b!439818 m!426485))

(declare-fun m!426487 () Bool)

(assert (=> b!439818 m!426487))

(declare-fun m!426489 () Bool)

(assert (=> b!439822 m!426489))

(declare-fun m!426491 () Bool)

(assert (=> b!439822 m!426491))

(assert (=> b!439822 m!426491))

(declare-fun m!426493 () Bool)

(assert (=> b!439822 m!426493))

(declare-fun m!426495 () Bool)

(assert (=> b!439822 m!426495))

(declare-fun m!426497 () Bool)

(assert (=> b!439821 m!426497))

(declare-fun m!426499 () Bool)

(assert (=> b!439825 m!426499))

(declare-fun m!426501 () Bool)

(assert (=> b!439826 m!426501))

(declare-fun m!426503 () Bool)

(assert (=> b!439820 m!426503))

(declare-fun m!426505 () Bool)

(assert (=> b!439823 m!426505))

(declare-fun m!426507 () Bool)

(assert (=> b!439823 m!426507))

(check-sat (not b!439813) (not b_next!10447) (not start!40166) tp_is_empty!11599 (not b!439822) b_and!18389 (not b!439818) (not b!439817) (not b!439819) (not b!439823) (not b!439826) (not b!439821) (not b!439820) (not mapNonEmpty!19020))
(check-sat b_and!18389 (not b_next!10447))
