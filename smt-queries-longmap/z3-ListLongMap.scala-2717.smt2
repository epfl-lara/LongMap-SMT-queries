; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40106 () Bool)

(assert start!40106)

(declare-fun b_free!10387 () Bool)

(declare-fun b_next!10387 () Bool)

(assert (=> start!40106 (= b_free!10387 (not b_next!10387))))

(declare-fun tp!36689 () Bool)

(declare-fun b_and!18369 () Bool)

(assert (=> start!40106 (= tp!36689 b_and!18369)))

(declare-fun b!438595 () Bool)

(declare-fun res!259038 () Bool)

(declare-fun e!258673 () Bool)

(assert (=> b!438595 (=> (not res!259038) (not e!258673))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438595 (= res!259038 (bvsle from!863 i!563))))

(declare-fun b!438596 () Bool)

(declare-fun e!258676 () Bool)

(assert (=> b!438596 (= e!258676 e!258673)))

(declare-fun res!259042 () Bool)

(assert (=> b!438596 (=> (not res!259042) (not e!258673))))

(declare-datatypes ((array!26900 0))(
  ( (array!26901 (arr!12899 (Array (_ BitVec 32) (_ BitVec 64))) (size!13251 (_ BitVec 32))) )
))
(declare-fun lt!202042 () array!26900)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26900 (_ BitVec 32)) Bool)

(assert (=> b!438596 (= res!259042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202042 mask!1025))))

(declare-fun _keys!709 () array!26900)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!438596 (= lt!202042 (array!26901 (store (arr!12899 _keys!709) i!563 k0!794) (size!13251 _keys!709)))))

(declare-fun b!438597 () Bool)

(declare-fun res!259039 () Bool)

(assert (=> b!438597 (=> (not res!259039) (not e!258676))))

(assert (=> b!438597 (= res!259039 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13251 _keys!709))))))

(declare-fun b!438598 () Bool)

(declare-fun res!259043 () Bool)

(assert (=> b!438598 (=> (not res!259043) (not e!258676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438598 (= res!259043 (validKeyInArray!0 k0!794))))

(declare-fun b!438599 () Bool)

(declare-fun res!259037 () Bool)

(assert (=> b!438599 (=> (not res!259037) (not e!258676))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16491 0))(
  ( (V!16492 (val!5814 Int)) )
))
(declare-datatypes ((ValueCell!5426 0))(
  ( (ValueCellFull!5426 (v!8062 V!16491)) (EmptyCell!5426) )
))
(declare-datatypes ((array!26902 0))(
  ( (array!26903 (arr!12900 (Array (_ BitVec 32) ValueCell!5426)) (size!13252 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26902)

(assert (=> b!438599 (= res!259037 (and (= (size!13252 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13251 _keys!709) (size!13252 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438600 () Bool)

(declare-fun res!259036 () Bool)

(assert (=> b!438600 (=> (not res!259036) (not e!258676))))

(assert (=> b!438600 (= res!259036 (or (= (select (arr!12899 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12899 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438601 () Bool)

(declare-fun res!259044 () Bool)

(assert (=> b!438601 (=> (not res!259044) (not e!258676))))

(declare-datatypes ((List!7607 0))(
  ( (Nil!7604) (Cons!7603 (h!8459 (_ BitVec 64)) (t!13355 List!7607)) )
))
(declare-fun arrayNoDuplicates!0 (array!26900 (_ BitVec 32) List!7607) Bool)

(assert (=> b!438601 (= res!259044 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7604))))

(declare-fun b!438602 () Bool)

(declare-fun e!258675 () Bool)

(declare-fun tp_is_empty!11539 () Bool)

(assert (=> b!438602 (= e!258675 tp_is_empty!11539)))

(declare-fun b!438603 () Bool)

(declare-fun e!258674 () Bool)

(assert (=> b!438603 (= e!258674 tp_is_empty!11539)))

(declare-fun b!438604 () Bool)

(declare-fun res!259035 () Bool)

(assert (=> b!438604 (=> (not res!259035) (not e!258673))))

(assert (=> b!438604 (= res!259035 (arrayNoDuplicates!0 lt!202042 #b00000000000000000000000000000000 Nil!7604))))

(declare-fun b!438605 () Bool)

(declare-fun res!259045 () Bool)

(assert (=> b!438605 (=> (not res!259045) (not e!258676))))

(assert (=> b!438605 (= res!259045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438606 () Bool)

(declare-fun e!258678 () Bool)

(assert (=> b!438606 (= e!258678 (not true))))

(declare-fun minValue!515 () V!16491)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16491)

(declare-fun lt!202043 () array!26902)

(declare-fun v!412 () V!16491)

(declare-datatypes ((tuple2!7620 0))(
  ( (tuple2!7621 (_1!3821 (_ BitVec 64)) (_2!3821 V!16491)) )
))
(declare-datatypes ((List!7608 0))(
  ( (Nil!7605) (Cons!7604 (h!8460 tuple2!7620) (t!13356 List!7608)) )
))
(declare-datatypes ((ListLongMap!6535 0))(
  ( (ListLongMap!6536 (toList!3283 List!7608)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1516 (array!26900 array!26902 (_ BitVec 32) (_ BitVec 32) V!16491 V!16491 (_ BitVec 32) Int) ListLongMap!6535)

(declare-fun +!1478 (ListLongMap!6535 tuple2!7620) ListLongMap!6535)

(assert (=> b!438606 (= (getCurrentListMapNoExtraKeys!1516 lt!202042 lt!202043 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1478 (getCurrentListMapNoExtraKeys!1516 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7621 k0!794 v!412)))))

(declare-datatypes ((Unit!13031 0))(
  ( (Unit!13032) )
))
(declare-fun lt!202041 () Unit!13031)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!638 (array!26900 array!26902 (_ BitVec 32) (_ BitVec 32) V!16491 V!16491 (_ BitVec 32) (_ BitVec 64) V!16491 (_ BitVec 32) Int) Unit!13031)

(assert (=> b!438606 (= lt!202041 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!638 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438607 () Bool)

(assert (=> b!438607 (= e!258673 e!258678)))

(declare-fun res!259046 () Bool)

(assert (=> b!438607 (=> (not res!259046) (not e!258678))))

(assert (=> b!438607 (= res!259046 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202044 () ListLongMap!6535)

(assert (=> b!438607 (= lt!202044 (getCurrentListMapNoExtraKeys!1516 lt!202042 lt!202043 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438607 (= lt!202043 (array!26903 (store (arr!12900 _values!549) i!563 (ValueCellFull!5426 v!412)) (size!13252 _values!549)))))

(declare-fun lt!202040 () ListLongMap!6535)

(assert (=> b!438607 (= lt!202040 (getCurrentListMapNoExtraKeys!1516 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438608 () Bool)

(declare-fun res!259040 () Bool)

(assert (=> b!438608 (=> (not res!259040) (not e!258676))))

(declare-fun arrayContainsKey!0 (array!26900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438608 (= res!259040 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18930 () Bool)

(declare-fun mapRes!18930 () Bool)

(declare-fun tp!36690 () Bool)

(assert (=> mapNonEmpty!18930 (= mapRes!18930 (and tp!36690 e!258674))))

(declare-fun mapRest!18930 () (Array (_ BitVec 32) ValueCell!5426))

(declare-fun mapValue!18930 () ValueCell!5426)

(declare-fun mapKey!18930 () (_ BitVec 32))

(assert (=> mapNonEmpty!18930 (= (arr!12900 _values!549) (store mapRest!18930 mapKey!18930 mapValue!18930))))

(declare-fun mapIsEmpty!18930 () Bool)

(assert (=> mapIsEmpty!18930 mapRes!18930))

(declare-fun res!259047 () Bool)

(assert (=> start!40106 (=> (not res!259047) (not e!258676))))

(assert (=> start!40106 (= res!259047 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13251 _keys!709))))))

(assert (=> start!40106 e!258676))

(assert (=> start!40106 tp_is_empty!11539))

(assert (=> start!40106 tp!36689))

(assert (=> start!40106 true))

(declare-fun e!258679 () Bool)

(declare-fun array_inv!9434 (array!26902) Bool)

(assert (=> start!40106 (and (array_inv!9434 _values!549) e!258679)))

(declare-fun array_inv!9435 (array!26900) Bool)

(assert (=> start!40106 (array_inv!9435 _keys!709)))

(declare-fun b!438609 () Bool)

(declare-fun res!259041 () Bool)

(assert (=> b!438609 (=> (not res!259041) (not e!258676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438609 (= res!259041 (validMask!0 mask!1025))))

(declare-fun b!438610 () Bool)

(assert (=> b!438610 (= e!258679 (and e!258675 mapRes!18930))))

(declare-fun condMapEmpty!18930 () Bool)

(declare-fun mapDefault!18930 () ValueCell!5426)

(assert (=> b!438610 (= condMapEmpty!18930 (= (arr!12900 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5426)) mapDefault!18930)))))

(assert (= (and start!40106 res!259047) b!438609))

(assert (= (and b!438609 res!259041) b!438599))

(assert (= (and b!438599 res!259037) b!438605))

(assert (= (and b!438605 res!259045) b!438601))

(assert (= (and b!438601 res!259044) b!438597))

(assert (= (and b!438597 res!259039) b!438598))

(assert (= (and b!438598 res!259043) b!438600))

(assert (= (and b!438600 res!259036) b!438608))

(assert (= (and b!438608 res!259040) b!438596))

(assert (= (and b!438596 res!259042) b!438604))

(assert (= (and b!438604 res!259035) b!438595))

(assert (= (and b!438595 res!259038) b!438607))

(assert (= (and b!438607 res!259046) b!438606))

(assert (= (and b!438610 condMapEmpty!18930) mapIsEmpty!18930))

(assert (= (and b!438610 (not condMapEmpty!18930)) mapNonEmpty!18930))

(get-info :version)

(assert (= (and mapNonEmpty!18930 ((_ is ValueCellFull!5426) mapValue!18930)) b!438603))

(assert (= (and b!438610 ((_ is ValueCellFull!5426) mapDefault!18930)) b!438602))

(assert (= start!40106 b!438610))

(declare-fun m!426281 () Bool)

(assert (=> b!438609 m!426281))

(declare-fun m!426283 () Bool)

(assert (=> b!438601 m!426283))

(declare-fun m!426285 () Bool)

(assert (=> b!438596 m!426285))

(declare-fun m!426287 () Bool)

(assert (=> b!438596 m!426287))

(declare-fun m!426289 () Bool)

(assert (=> b!438606 m!426289))

(declare-fun m!426291 () Bool)

(assert (=> b!438606 m!426291))

(assert (=> b!438606 m!426291))

(declare-fun m!426293 () Bool)

(assert (=> b!438606 m!426293))

(declare-fun m!426295 () Bool)

(assert (=> b!438606 m!426295))

(declare-fun m!426297 () Bool)

(assert (=> b!438598 m!426297))

(declare-fun m!426299 () Bool)

(assert (=> b!438604 m!426299))

(declare-fun m!426301 () Bool)

(assert (=> mapNonEmpty!18930 m!426301))

(declare-fun m!426303 () Bool)

(assert (=> b!438608 m!426303))

(declare-fun m!426305 () Bool)

(assert (=> b!438607 m!426305))

(declare-fun m!426307 () Bool)

(assert (=> b!438607 m!426307))

(declare-fun m!426309 () Bool)

(assert (=> b!438607 m!426309))

(declare-fun m!426311 () Bool)

(assert (=> b!438600 m!426311))

(declare-fun m!426313 () Bool)

(assert (=> start!40106 m!426313))

(declare-fun m!426315 () Bool)

(assert (=> start!40106 m!426315))

(declare-fun m!426317 () Bool)

(assert (=> b!438605 m!426317))

(check-sat (not b!438605) (not b!438604) (not b!438598) (not b!438601) (not b!438606) tp_is_empty!11539 (not b_next!10387) (not b!438608) (not b!438609) (not mapNonEmpty!18930) (not b!438607) (not b!438596) (not start!40106) b_and!18369)
(check-sat b_and!18369 (not b_next!10387))
