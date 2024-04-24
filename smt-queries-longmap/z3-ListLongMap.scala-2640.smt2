; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39644 () Bool)

(assert start!39644)

(declare-fun b_free!9925 () Bool)

(declare-fun b_next!9925 () Bool)

(assert (=> start!39644 (= b_free!9925 (not b_next!9925))))

(declare-fun tp!35303 () Bool)

(declare-fun b_and!17595 () Bool)

(assert (=> start!39644 (= tp!35303 b_and!17595)))

(declare-fun b!425566 () Bool)

(declare-fun res!249228 () Bool)

(declare-fun e!252609 () Bool)

(assert (=> b!425566 (=> (not res!249228) (not e!252609))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425566 (= res!249228 (bvsle from!863 i!563))))

(declare-fun b!425567 () Bool)

(declare-fun e!252608 () Bool)

(assert (=> b!425567 (= e!252609 e!252608)))

(declare-fun res!249236 () Bool)

(assert (=> b!425567 (=> (not res!249236) (not e!252608))))

(assert (=> b!425567 (= res!249236 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15875 0))(
  ( (V!15876 (val!5583 Int)) )
))
(declare-fun minValue!515 () V!15875)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15875)

(declare-datatypes ((ValueCell!5195 0))(
  ( (ValueCellFull!5195 (v!7831 V!15875)) (EmptyCell!5195) )
))
(declare-datatypes ((array!26000 0))(
  ( (array!26001 (arr!12449 (Array (_ BitVec 32) ValueCell!5195)) (size!12801 (_ BitVec 32))) )
))
(declare-fun lt!194727 () array!26000)

(declare-datatypes ((tuple2!7228 0))(
  ( (tuple2!7229 (_1!3625 (_ BitVec 64)) (_2!3625 V!15875)) )
))
(declare-datatypes ((List!7236 0))(
  ( (Nil!7233) (Cons!7232 (h!8088 tuple2!7228) (t!12672 List!7236)) )
))
(declare-datatypes ((ListLongMap!6143 0))(
  ( (ListLongMap!6144 (toList!3087 List!7236)) )
))
(declare-fun lt!194725 () ListLongMap!6143)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26002 0))(
  ( (array!26003 (arr!12450 (Array (_ BitVec 32) (_ BitVec 64))) (size!12802 (_ BitVec 32))) )
))
(declare-fun lt!194723 () array!26002)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1333 (array!26002 array!26000 (_ BitVec 32) (_ BitVec 32) V!15875 V!15875 (_ BitVec 32) Int) ListLongMap!6143)

(assert (=> b!425567 (= lt!194725 (getCurrentListMapNoExtraKeys!1333 lt!194723 lt!194727 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26000)

(declare-fun v!412 () V!15875)

(assert (=> b!425567 (= lt!194727 (array!26001 (store (arr!12449 _values!549) i!563 (ValueCellFull!5195 v!412)) (size!12801 _values!549)))))

(declare-fun lt!194724 () ListLongMap!6143)

(declare-fun _keys!709 () array!26002)

(assert (=> b!425567 (= lt!194724 (getCurrentListMapNoExtraKeys!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425568 () Bool)

(declare-fun e!252612 () Bool)

(assert (=> b!425568 (= e!252612 e!252609)))

(declare-fun res!249225 () Bool)

(assert (=> b!425568 (=> (not res!249225) (not e!252609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26002 (_ BitVec 32)) Bool)

(assert (=> b!425568 (= res!249225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194723 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!425568 (= lt!194723 (array!26003 (store (arr!12450 _keys!709) i!563 k0!794) (size!12802 _keys!709)))))

(declare-fun mapIsEmpty!18237 () Bool)

(declare-fun mapRes!18237 () Bool)

(assert (=> mapIsEmpty!18237 mapRes!18237))

(declare-fun b!425569 () Bool)

(declare-fun e!252610 () Bool)

(declare-fun tp_is_empty!11077 () Bool)

(assert (=> b!425569 (= e!252610 tp_is_empty!11077)))

(declare-fun b!425570 () Bool)

(declare-fun res!249232 () Bool)

(assert (=> b!425570 (=> (not res!249232) (not e!252612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425570 (= res!249232 (validMask!0 mask!1025))))

(declare-fun b!425571 () Bool)

(declare-fun e!252607 () Bool)

(declare-fun e!252611 () Bool)

(assert (=> b!425571 (= e!252607 (and e!252611 mapRes!18237))))

(declare-fun condMapEmpty!18237 () Bool)

(declare-fun mapDefault!18237 () ValueCell!5195)

(assert (=> b!425571 (= condMapEmpty!18237 (= (arr!12449 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5195)) mapDefault!18237)))))

(declare-fun b!425572 () Bool)

(declare-fun res!249234 () Bool)

(assert (=> b!425572 (=> (not res!249234) (not e!252612))))

(assert (=> b!425572 (= res!249234 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12802 _keys!709))))))

(declare-fun b!425573 () Bool)

(declare-fun res!249237 () Bool)

(assert (=> b!425573 (=> (not res!249237) (not e!252612))))

(assert (=> b!425573 (= res!249237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425574 () Bool)

(declare-fun res!249235 () Bool)

(assert (=> b!425574 (=> (not res!249235) (not e!252609))))

(declare-datatypes ((List!7237 0))(
  ( (Nil!7234) (Cons!7233 (h!8089 (_ BitVec 64)) (t!12673 List!7237)) )
))
(declare-fun arrayNoDuplicates!0 (array!26002 (_ BitVec 32) List!7237) Bool)

(assert (=> b!425574 (= res!249235 (arrayNoDuplicates!0 lt!194723 #b00000000000000000000000000000000 Nil!7234))))

(declare-fun b!425576 () Bool)

(declare-fun res!249227 () Bool)

(assert (=> b!425576 (=> (not res!249227) (not e!252612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425576 (= res!249227 (validKeyInArray!0 k0!794))))

(declare-fun b!425577 () Bool)

(assert (=> b!425577 (= e!252608 (not true))))

(declare-fun +!1303 (ListLongMap!6143 tuple2!7228) ListLongMap!6143)

(assert (=> b!425577 (= (getCurrentListMapNoExtraKeys!1333 lt!194723 lt!194727 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1303 (getCurrentListMapNoExtraKeys!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7229 k0!794 v!412)))))

(declare-datatypes ((Unit!12481 0))(
  ( (Unit!12482) )
))
(declare-fun lt!194726 () Unit!12481)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!487 (array!26002 array!26000 (_ BitVec 32) (_ BitVec 32) V!15875 V!15875 (_ BitVec 32) (_ BitVec 64) V!15875 (_ BitVec 32) Int) Unit!12481)

(assert (=> b!425577 (= lt!194726 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!487 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425578 () Bool)

(declare-fun res!249229 () Bool)

(assert (=> b!425578 (=> (not res!249229) (not e!252612))))

(assert (=> b!425578 (= res!249229 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7234))))

(declare-fun mapNonEmpty!18237 () Bool)

(declare-fun tp!35304 () Bool)

(assert (=> mapNonEmpty!18237 (= mapRes!18237 (and tp!35304 e!252610))))

(declare-fun mapValue!18237 () ValueCell!5195)

(declare-fun mapKey!18237 () (_ BitVec 32))

(declare-fun mapRest!18237 () (Array (_ BitVec 32) ValueCell!5195))

(assert (=> mapNonEmpty!18237 (= (arr!12449 _values!549) (store mapRest!18237 mapKey!18237 mapValue!18237))))

(declare-fun b!425579 () Bool)

(declare-fun res!249230 () Bool)

(assert (=> b!425579 (=> (not res!249230) (not e!252612))))

(assert (=> b!425579 (= res!249230 (or (= (select (arr!12450 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12450 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!249226 () Bool)

(assert (=> start!39644 (=> (not res!249226) (not e!252612))))

(assert (=> start!39644 (= res!249226 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12802 _keys!709))))))

(assert (=> start!39644 e!252612))

(assert (=> start!39644 tp_is_empty!11077))

(assert (=> start!39644 tp!35303))

(assert (=> start!39644 true))

(declare-fun array_inv!9144 (array!26000) Bool)

(assert (=> start!39644 (and (array_inv!9144 _values!549) e!252607)))

(declare-fun array_inv!9145 (array!26002) Bool)

(assert (=> start!39644 (array_inv!9145 _keys!709)))

(declare-fun b!425575 () Bool)

(declare-fun res!249231 () Bool)

(assert (=> b!425575 (=> (not res!249231) (not e!252612))))

(declare-fun arrayContainsKey!0 (array!26002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425575 (= res!249231 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425580 () Bool)

(assert (=> b!425580 (= e!252611 tp_is_empty!11077)))

(declare-fun b!425581 () Bool)

(declare-fun res!249233 () Bool)

(assert (=> b!425581 (=> (not res!249233) (not e!252612))))

(assert (=> b!425581 (= res!249233 (and (= (size!12801 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12802 _keys!709) (size!12801 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39644 res!249226) b!425570))

(assert (= (and b!425570 res!249232) b!425581))

(assert (= (and b!425581 res!249233) b!425573))

(assert (= (and b!425573 res!249237) b!425578))

(assert (= (and b!425578 res!249229) b!425572))

(assert (= (and b!425572 res!249234) b!425576))

(assert (= (and b!425576 res!249227) b!425579))

(assert (= (and b!425579 res!249230) b!425575))

(assert (= (and b!425575 res!249231) b!425568))

(assert (= (and b!425568 res!249225) b!425574))

(assert (= (and b!425574 res!249235) b!425566))

(assert (= (and b!425566 res!249228) b!425567))

(assert (= (and b!425567 res!249236) b!425577))

(assert (= (and b!425571 condMapEmpty!18237) mapIsEmpty!18237))

(assert (= (and b!425571 (not condMapEmpty!18237)) mapNonEmpty!18237))

(get-info :version)

(assert (= (and mapNonEmpty!18237 ((_ is ValueCellFull!5195) mapValue!18237)) b!425569))

(assert (= (and b!425571 ((_ is ValueCellFull!5195) mapDefault!18237)) b!425580))

(assert (= start!39644 b!425571))

(declare-fun m!414695 () Bool)

(assert (=> b!425576 m!414695))

(declare-fun m!414697 () Bool)

(assert (=> start!39644 m!414697))

(declare-fun m!414699 () Bool)

(assert (=> start!39644 m!414699))

(declare-fun m!414701 () Bool)

(assert (=> b!425575 m!414701))

(declare-fun m!414703 () Bool)

(assert (=> b!425570 m!414703))

(declare-fun m!414705 () Bool)

(assert (=> b!425579 m!414705))

(declare-fun m!414707 () Bool)

(assert (=> b!425568 m!414707))

(declare-fun m!414709 () Bool)

(assert (=> b!425568 m!414709))

(declare-fun m!414711 () Bool)

(assert (=> b!425574 m!414711))

(declare-fun m!414713 () Bool)

(assert (=> b!425573 m!414713))

(declare-fun m!414715 () Bool)

(assert (=> b!425578 m!414715))

(declare-fun m!414717 () Bool)

(assert (=> b!425567 m!414717))

(declare-fun m!414719 () Bool)

(assert (=> b!425567 m!414719))

(declare-fun m!414721 () Bool)

(assert (=> b!425567 m!414721))

(declare-fun m!414723 () Bool)

(assert (=> mapNonEmpty!18237 m!414723))

(declare-fun m!414725 () Bool)

(assert (=> b!425577 m!414725))

(declare-fun m!414727 () Bool)

(assert (=> b!425577 m!414727))

(assert (=> b!425577 m!414727))

(declare-fun m!414729 () Bool)

(assert (=> b!425577 m!414729))

(declare-fun m!414731 () Bool)

(assert (=> b!425577 m!414731))

(check-sat (not mapNonEmpty!18237) (not b!425577) tp_is_empty!11077 (not b!425573) (not b!425575) (not b!425567) (not b!425574) (not b_next!9925) (not b!425568) (not start!39644) (not b!425578) (not b!425570) (not b!425576) b_and!17595)
(check-sat b_and!17595 (not b_next!9925))
