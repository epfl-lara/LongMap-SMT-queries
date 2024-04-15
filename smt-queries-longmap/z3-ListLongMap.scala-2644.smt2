; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39668 () Bool)

(assert start!39668)

(declare-fun b_free!9949 () Bool)

(declare-fun b_next!9949 () Bool)

(assert (=> start!39668 (= b_free!9949 (not b_next!9949))))

(declare-fun tp!35375 () Bool)

(declare-fun b_and!17579 () Bool)

(assert (=> start!39668 (= tp!35375 b_and!17579)))

(declare-fun b!425920 () Bool)

(declare-fun e!252723 () Bool)

(declare-fun tp_is_empty!11101 () Bool)

(assert (=> b!425920 (= e!252723 tp_is_empty!11101)))

(declare-fun b!425921 () Bool)

(declare-fun e!252720 () Bool)

(assert (=> b!425921 (= e!252720 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15907 0))(
  ( (V!15908 (val!5595 Int)) )
))
(declare-datatypes ((ValueCell!5207 0))(
  ( (ValueCellFull!5207 (v!7836 V!15907)) (EmptyCell!5207) )
))
(declare-datatypes ((array!26031 0))(
  ( (array!26032 (arr!12465 (Array (_ BitVec 32) ValueCell!5207)) (size!12818 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26031)

(declare-fun zeroValue!515 () V!15907)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26033 0))(
  ( (array!26034 (arr!12466 (Array (_ BitVec 32) (_ BitVec 64))) (size!12819 (_ BitVec 32))) )
))
(declare-fun lt!194653 () array!26033)

(declare-fun v!412 () V!15907)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26033)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15907)

(declare-fun lt!194651 () array!26031)

(declare-datatypes ((tuple2!7346 0))(
  ( (tuple2!7347 (_1!3684 (_ BitVec 64)) (_2!3684 V!15907)) )
))
(declare-datatypes ((List!7347 0))(
  ( (Nil!7344) (Cons!7343 (h!8199 tuple2!7346) (t!12782 List!7347)) )
))
(declare-datatypes ((ListLongMap!6249 0))(
  ( (ListLongMap!6250 (toList!3140 List!7347)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1348 (array!26033 array!26031 (_ BitVec 32) (_ BitVec 32) V!15907 V!15907 (_ BitVec 32) Int) ListLongMap!6249)

(declare-fun +!1320 (ListLongMap!6249 tuple2!7346) ListLongMap!6249)

(assert (=> b!425921 (= (getCurrentListMapNoExtraKeys!1348 lt!194653 lt!194651 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1320 (getCurrentListMapNoExtraKeys!1348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7347 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12486 0))(
  ( (Unit!12487) )
))
(declare-fun lt!194654 () Unit!12486)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!491 (array!26033 array!26031 (_ BitVec 32) (_ BitVec 32) V!15907 V!15907 (_ BitVec 32) (_ BitVec 64) V!15907 (_ BitVec 32) Int) Unit!12486)

(assert (=> b!425921 (= lt!194654 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!491 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425922 () Bool)

(declare-fun res!249574 () Bool)

(declare-fun e!252719 () Bool)

(assert (=> b!425922 (=> (not res!249574) (not e!252719))))

(declare-datatypes ((List!7348 0))(
  ( (Nil!7345) (Cons!7344 (h!8200 (_ BitVec 64)) (t!12783 List!7348)) )
))
(declare-fun arrayNoDuplicates!0 (array!26033 (_ BitVec 32) List!7348) Bool)

(assert (=> b!425922 (= res!249574 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7345))))

(declare-fun b!425923 () Bool)

(declare-fun res!249571 () Bool)

(assert (=> b!425923 (=> (not res!249571) (not e!252719))))

(assert (=> b!425923 (= res!249571 (and (= (size!12818 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12819 _keys!709) (size!12818 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18273 () Bool)

(declare-fun mapRes!18273 () Bool)

(assert (=> mapIsEmpty!18273 mapRes!18273))

(declare-fun b!425924 () Bool)

(declare-fun res!249568 () Bool)

(assert (=> b!425924 (=> (not res!249568) (not e!252719))))

(declare-fun arrayContainsKey!0 (array!26033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425924 (= res!249568 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425925 () Bool)

(declare-fun e!252721 () Bool)

(assert (=> b!425925 (= e!252721 tp_is_empty!11101)))

(declare-fun mapNonEmpty!18273 () Bool)

(declare-fun tp!35376 () Bool)

(assert (=> mapNonEmpty!18273 (= mapRes!18273 (and tp!35376 e!252721))))

(declare-fun mapKey!18273 () (_ BitVec 32))

(declare-fun mapValue!18273 () ValueCell!5207)

(declare-fun mapRest!18273 () (Array (_ BitVec 32) ValueCell!5207))

(assert (=> mapNonEmpty!18273 (= (arr!12465 _values!549) (store mapRest!18273 mapKey!18273 mapValue!18273))))

(declare-fun b!425926 () Bool)

(declare-fun res!249576 () Bool)

(declare-fun e!252717 () Bool)

(assert (=> b!425926 (=> (not res!249576) (not e!252717))))

(assert (=> b!425926 (= res!249576 (bvsle from!863 i!563))))

(declare-fun b!425927 () Bool)

(declare-fun res!249575 () Bool)

(assert (=> b!425927 (=> (not res!249575) (not e!252719))))

(assert (=> b!425927 (= res!249575 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12819 _keys!709))))))

(declare-fun res!249567 () Bool)

(assert (=> start!39668 (=> (not res!249567) (not e!252719))))

(assert (=> start!39668 (= res!249567 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12819 _keys!709))))))

(assert (=> start!39668 e!252719))

(assert (=> start!39668 tp_is_empty!11101))

(assert (=> start!39668 tp!35375))

(assert (=> start!39668 true))

(declare-fun e!252718 () Bool)

(declare-fun array_inv!9114 (array!26031) Bool)

(assert (=> start!39668 (and (array_inv!9114 _values!549) e!252718)))

(declare-fun array_inv!9115 (array!26033) Bool)

(assert (=> start!39668 (array_inv!9115 _keys!709)))

(declare-fun b!425928 () Bool)

(assert (=> b!425928 (= e!252717 e!252720)))

(declare-fun res!249577 () Bool)

(assert (=> b!425928 (=> (not res!249577) (not e!252720))))

(assert (=> b!425928 (= res!249577 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194652 () ListLongMap!6249)

(assert (=> b!425928 (= lt!194652 (getCurrentListMapNoExtraKeys!1348 lt!194653 lt!194651 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425928 (= lt!194651 (array!26032 (store (arr!12465 _values!549) i!563 (ValueCellFull!5207 v!412)) (size!12818 _values!549)))))

(declare-fun lt!194650 () ListLongMap!6249)

(assert (=> b!425928 (= lt!194650 (getCurrentListMapNoExtraKeys!1348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425929 () Bool)

(assert (=> b!425929 (= e!252718 (and e!252723 mapRes!18273))))

(declare-fun condMapEmpty!18273 () Bool)

(declare-fun mapDefault!18273 () ValueCell!5207)

(assert (=> b!425929 (= condMapEmpty!18273 (= (arr!12465 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5207)) mapDefault!18273)))))

(declare-fun b!425930 () Bool)

(declare-fun res!249578 () Bool)

(assert (=> b!425930 (=> (not res!249578) (not e!252719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425930 (= res!249578 (validMask!0 mask!1025))))

(declare-fun b!425931 () Bool)

(declare-fun res!249579 () Bool)

(assert (=> b!425931 (=> (not res!249579) (not e!252719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425931 (= res!249579 (validKeyInArray!0 k0!794))))

(declare-fun b!425932 () Bool)

(declare-fun res!249572 () Bool)

(assert (=> b!425932 (=> (not res!249572) (not e!252719))))

(assert (=> b!425932 (= res!249572 (or (= (select (arr!12466 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12466 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425933 () Bool)

(declare-fun res!249573 () Bool)

(assert (=> b!425933 (=> (not res!249573) (not e!252719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26033 (_ BitVec 32)) Bool)

(assert (=> b!425933 (= res!249573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425934 () Bool)

(assert (=> b!425934 (= e!252719 e!252717)))

(declare-fun res!249569 () Bool)

(assert (=> b!425934 (=> (not res!249569) (not e!252717))))

(assert (=> b!425934 (= res!249569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194653 mask!1025))))

(assert (=> b!425934 (= lt!194653 (array!26034 (store (arr!12466 _keys!709) i!563 k0!794) (size!12819 _keys!709)))))

(declare-fun b!425935 () Bool)

(declare-fun res!249570 () Bool)

(assert (=> b!425935 (=> (not res!249570) (not e!252717))))

(assert (=> b!425935 (= res!249570 (arrayNoDuplicates!0 lt!194653 #b00000000000000000000000000000000 Nil!7345))))

(assert (= (and start!39668 res!249567) b!425930))

(assert (= (and b!425930 res!249578) b!425923))

(assert (= (and b!425923 res!249571) b!425933))

(assert (= (and b!425933 res!249573) b!425922))

(assert (= (and b!425922 res!249574) b!425927))

(assert (= (and b!425927 res!249575) b!425931))

(assert (= (and b!425931 res!249579) b!425932))

(assert (= (and b!425932 res!249572) b!425924))

(assert (= (and b!425924 res!249568) b!425934))

(assert (= (and b!425934 res!249569) b!425935))

(assert (= (and b!425935 res!249570) b!425926))

(assert (= (and b!425926 res!249576) b!425928))

(assert (= (and b!425928 res!249577) b!425921))

(assert (= (and b!425929 condMapEmpty!18273) mapIsEmpty!18273))

(assert (= (and b!425929 (not condMapEmpty!18273)) mapNonEmpty!18273))

(get-info :version)

(assert (= (and mapNonEmpty!18273 ((_ is ValueCellFull!5207) mapValue!18273)) b!425925))

(assert (= (and b!425929 ((_ is ValueCellFull!5207) mapDefault!18273)) b!425920))

(assert (= start!39668 b!425929))

(declare-fun m!414201 () Bool)

(assert (=> b!425933 m!414201))

(declare-fun m!414203 () Bool)

(assert (=> mapNonEmpty!18273 m!414203))

(declare-fun m!414205 () Bool)

(assert (=> b!425921 m!414205))

(declare-fun m!414207 () Bool)

(assert (=> b!425921 m!414207))

(assert (=> b!425921 m!414207))

(declare-fun m!414209 () Bool)

(assert (=> b!425921 m!414209))

(declare-fun m!414211 () Bool)

(assert (=> b!425921 m!414211))

(declare-fun m!414213 () Bool)

(assert (=> start!39668 m!414213))

(declare-fun m!414215 () Bool)

(assert (=> start!39668 m!414215))

(declare-fun m!414217 () Bool)

(assert (=> b!425924 m!414217))

(declare-fun m!414219 () Bool)

(assert (=> b!425931 m!414219))

(declare-fun m!414221 () Bool)

(assert (=> b!425935 m!414221))

(declare-fun m!414223 () Bool)

(assert (=> b!425932 m!414223))

(declare-fun m!414225 () Bool)

(assert (=> b!425930 m!414225))

(declare-fun m!414227 () Bool)

(assert (=> b!425928 m!414227))

(declare-fun m!414229 () Bool)

(assert (=> b!425928 m!414229))

(declare-fun m!414231 () Bool)

(assert (=> b!425928 m!414231))

(declare-fun m!414233 () Bool)

(assert (=> b!425922 m!414233))

(declare-fun m!414235 () Bool)

(assert (=> b!425934 m!414235))

(declare-fun m!414237 () Bool)

(assert (=> b!425934 m!414237))

(check-sat (not b!425933) (not b!425934) tp_is_empty!11101 (not b!425935) (not b!425921) (not b_next!9949) (not b!425930) (not mapNonEmpty!18273) (not b!425924) b_and!17579 (not b!425928) (not start!39668) (not b!425931) (not b!425922))
(check-sat b_and!17579 (not b_next!9949))
