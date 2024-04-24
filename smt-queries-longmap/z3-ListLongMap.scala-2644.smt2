; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39668 () Bool)

(assert start!39668)

(declare-fun b_free!9949 () Bool)

(declare-fun b_next!9949 () Bool)

(assert (=> start!39668 (= b_free!9949 (not b_next!9949))))

(declare-fun tp!35376 () Bool)

(declare-fun b_and!17619 () Bool)

(assert (=> start!39668 (= tp!35376 b_and!17619)))

(declare-fun b!426142 () Bool)

(declare-fun res!249699 () Bool)

(declare-fun e!252865 () Bool)

(assert (=> b!426142 (=> (not res!249699) (not e!252865))))

(declare-datatypes ((array!26048 0))(
  ( (array!26049 (arr!12473 (Array (_ BitVec 32) (_ BitVec 64))) (size!12825 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26048)

(declare-datatypes ((List!7257 0))(
  ( (Nil!7254) (Cons!7253 (h!8109 (_ BitVec 64)) (t!12693 List!7257)) )
))
(declare-fun arrayNoDuplicates!0 (array!26048 (_ BitVec 32) List!7257) Bool)

(assert (=> b!426142 (= res!249699 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7254))))

(declare-fun b!426143 () Bool)

(declare-fun res!249698 () Bool)

(declare-fun e!252862 () Bool)

(assert (=> b!426143 (=> (not res!249698) (not e!252862))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426143 (= res!249698 (bvsle from!863 i!563))))

(declare-fun b!426144 () Bool)

(declare-fun res!249702 () Bool)

(assert (=> b!426144 (=> (not res!249702) (not e!252865))))

(assert (=> b!426144 (= res!249702 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12825 _keys!709))))))

(declare-fun b!426145 () Bool)

(declare-fun res!249696 () Bool)

(assert (=> b!426145 (=> (not res!249696) (not e!252865))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426145 (= res!249696 (validKeyInArray!0 k0!794))))

(declare-fun b!426146 () Bool)

(declare-fun res!249694 () Bool)

(assert (=> b!426146 (=> (not res!249694) (not e!252865))))

(declare-fun arrayContainsKey!0 (array!26048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426146 (= res!249694 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!249700 () Bool)

(assert (=> start!39668 (=> (not res!249700) (not e!252865))))

(assert (=> start!39668 (= res!249700 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12825 _keys!709))))))

(assert (=> start!39668 e!252865))

(declare-fun tp_is_empty!11101 () Bool)

(assert (=> start!39668 tp_is_empty!11101))

(assert (=> start!39668 tp!35376))

(assert (=> start!39668 true))

(declare-datatypes ((V!15907 0))(
  ( (V!15908 (val!5595 Int)) )
))
(declare-datatypes ((ValueCell!5207 0))(
  ( (ValueCellFull!5207 (v!7843 V!15907)) (EmptyCell!5207) )
))
(declare-datatypes ((array!26050 0))(
  ( (array!26051 (arr!12474 (Array (_ BitVec 32) ValueCell!5207)) (size!12826 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26050)

(declare-fun e!252863 () Bool)

(declare-fun array_inv!9160 (array!26050) Bool)

(assert (=> start!39668 (and (array_inv!9160 _values!549) e!252863)))

(declare-fun array_inv!9161 (array!26048) Bool)

(assert (=> start!39668 (array_inv!9161 _keys!709)))

(declare-fun b!426147 () Bool)

(assert (=> b!426147 (= e!252865 e!252862)))

(declare-fun res!249693 () Bool)

(assert (=> b!426147 (=> (not res!249693) (not e!252862))))

(declare-fun lt!194904 () array!26048)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26048 (_ BitVec 32)) Bool)

(assert (=> b!426147 (= res!249693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194904 mask!1025))))

(assert (=> b!426147 (= lt!194904 (array!26049 (store (arr!12473 _keys!709) i!563 k0!794) (size!12825 _keys!709)))))

(declare-fun mapIsEmpty!18273 () Bool)

(declare-fun mapRes!18273 () Bool)

(assert (=> mapIsEmpty!18273 mapRes!18273))

(declare-fun b!426148 () Bool)

(declare-fun res!249703 () Bool)

(assert (=> b!426148 (=> (not res!249703) (not e!252865))))

(assert (=> b!426148 (= res!249703 (or (= (select (arr!12473 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12473 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426149 () Bool)

(declare-fun e!252864 () Bool)

(assert (=> b!426149 (= e!252862 e!252864)))

(declare-fun res!249695 () Bool)

(assert (=> b!426149 (=> (not res!249695) (not e!252864))))

(assert (=> b!426149 (= res!249695 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15907)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7250 0))(
  ( (tuple2!7251 (_1!3636 (_ BitVec 64)) (_2!3636 V!15907)) )
))
(declare-datatypes ((List!7258 0))(
  ( (Nil!7255) (Cons!7254 (h!8110 tuple2!7250) (t!12694 List!7258)) )
))
(declare-datatypes ((ListLongMap!6165 0))(
  ( (ListLongMap!6166 (toList!3098 List!7258)) )
))
(declare-fun lt!194906 () ListLongMap!6165)

(declare-fun zeroValue!515 () V!15907)

(declare-fun lt!194907 () array!26050)

(declare-fun getCurrentListMapNoExtraKeys!1344 (array!26048 array!26050 (_ BitVec 32) (_ BitVec 32) V!15907 V!15907 (_ BitVec 32) Int) ListLongMap!6165)

(assert (=> b!426149 (= lt!194906 (getCurrentListMapNoExtraKeys!1344 lt!194904 lt!194907 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15907)

(assert (=> b!426149 (= lt!194907 (array!26051 (store (arr!12474 _values!549) i!563 (ValueCellFull!5207 v!412)) (size!12826 _values!549)))))

(declare-fun lt!194905 () ListLongMap!6165)

(assert (=> b!426149 (= lt!194905 (getCurrentListMapNoExtraKeys!1344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426150 () Bool)

(declare-fun e!252861 () Bool)

(assert (=> b!426150 (= e!252863 (and e!252861 mapRes!18273))))

(declare-fun condMapEmpty!18273 () Bool)

(declare-fun mapDefault!18273 () ValueCell!5207)

(assert (=> b!426150 (= condMapEmpty!18273 (= (arr!12474 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5207)) mapDefault!18273)))))

(declare-fun b!426151 () Bool)

(declare-fun e!252859 () Bool)

(assert (=> b!426151 (= e!252859 tp_is_empty!11101)))

(declare-fun b!426152 () Bool)

(assert (=> b!426152 (= e!252864 (not true))))

(declare-fun +!1312 (ListLongMap!6165 tuple2!7250) ListLongMap!6165)

(assert (=> b!426152 (= (getCurrentListMapNoExtraKeys!1344 lt!194904 lt!194907 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1312 (getCurrentListMapNoExtraKeys!1344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7251 k0!794 v!412)))))

(declare-datatypes ((Unit!12499 0))(
  ( (Unit!12500) )
))
(declare-fun lt!194903 () Unit!12499)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!496 (array!26048 array!26050 (_ BitVec 32) (_ BitVec 32) V!15907 V!15907 (_ BitVec 32) (_ BitVec 64) V!15907 (_ BitVec 32) Int) Unit!12499)

(assert (=> b!426152 (= lt!194903 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!496 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426153 () Bool)

(declare-fun res!249704 () Bool)

(assert (=> b!426153 (=> (not res!249704) (not e!252865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426153 (= res!249704 (validMask!0 mask!1025))))

(declare-fun b!426154 () Bool)

(declare-fun res!249705 () Bool)

(assert (=> b!426154 (=> (not res!249705) (not e!252862))))

(assert (=> b!426154 (= res!249705 (arrayNoDuplicates!0 lt!194904 #b00000000000000000000000000000000 Nil!7254))))

(declare-fun b!426155 () Bool)

(assert (=> b!426155 (= e!252861 tp_is_empty!11101)))

(declare-fun b!426156 () Bool)

(declare-fun res!249697 () Bool)

(assert (=> b!426156 (=> (not res!249697) (not e!252865))))

(assert (=> b!426156 (= res!249697 (and (= (size!12826 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12825 _keys!709) (size!12826 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426157 () Bool)

(declare-fun res!249701 () Bool)

(assert (=> b!426157 (=> (not res!249701) (not e!252865))))

(assert (=> b!426157 (= res!249701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18273 () Bool)

(declare-fun tp!35375 () Bool)

(assert (=> mapNonEmpty!18273 (= mapRes!18273 (and tp!35375 e!252859))))

(declare-fun mapValue!18273 () ValueCell!5207)

(declare-fun mapRest!18273 () (Array (_ BitVec 32) ValueCell!5207))

(declare-fun mapKey!18273 () (_ BitVec 32))

(assert (=> mapNonEmpty!18273 (= (arr!12474 _values!549) (store mapRest!18273 mapKey!18273 mapValue!18273))))

(assert (= (and start!39668 res!249700) b!426153))

(assert (= (and b!426153 res!249704) b!426156))

(assert (= (and b!426156 res!249697) b!426157))

(assert (= (and b!426157 res!249701) b!426142))

(assert (= (and b!426142 res!249699) b!426144))

(assert (= (and b!426144 res!249702) b!426145))

(assert (= (and b!426145 res!249696) b!426148))

(assert (= (and b!426148 res!249703) b!426146))

(assert (= (and b!426146 res!249694) b!426147))

(assert (= (and b!426147 res!249693) b!426154))

(assert (= (and b!426154 res!249705) b!426143))

(assert (= (and b!426143 res!249698) b!426149))

(assert (= (and b!426149 res!249695) b!426152))

(assert (= (and b!426150 condMapEmpty!18273) mapIsEmpty!18273))

(assert (= (and b!426150 (not condMapEmpty!18273)) mapNonEmpty!18273))

(get-info :version)

(assert (= (and mapNonEmpty!18273 ((_ is ValueCellFull!5207) mapValue!18273)) b!426151))

(assert (= (and b!426150 ((_ is ValueCellFull!5207) mapDefault!18273)) b!426155))

(assert (= start!39668 b!426150))

(declare-fun m!415151 () Bool)

(assert (=> b!426145 m!415151))

(declare-fun m!415153 () Bool)

(assert (=> b!426152 m!415153))

(declare-fun m!415155 () Bool)

(assert (=> b!426152 m!415155))

(assert (=> b!426152 m!415155))

(declare-fun m!415157 () Bool)

(assert (=> b!426152 m!415157))

(declare-fun m!415159 () Bool)

(assert (=> b!426152 m!415159))

(declare-fun m!415161 () Bool)

(assert (=> b!426146 m!415161))

(declare-fun m!415163 () Bool)

(assert (=> b!426154 m!415163))

(declare-fun m!415165 () Bool)

(assert (=> mapNonEmpty!18273 m!415165))

(declare-fun m!415167 () Bool)

(assert (=> b!426148 m!415167))

(declare-fun m!415169 () Bool)

(assert (=> b!426153 m!415169))

(declare-fun m!415171 () Bool)

(assert (=> b!426142 m!415171))

(declare-fun m!415173 () Bool)

(assert (=> b!426157 m!415173))

(declare-fun m!415175 () Bool)

(assert (=> b!426149 m!415175))

(declare-fun m!415177 () Bool)

(assert (=> b!426149 m!415177))

(declare-fun m!415179 () Bool)

(assert (=> b!426149 m!415179))

(declare-fun m!415181 () Bool)

(assert (=> start!39668 m!415181))

(declare-fun m!415183 () Bool)

(assert (=> start!39668 m!415183))

(declare-fun m!415185 () Bool)

(assert (=> b!426147 m!415185))

(declare-fun m!415187 () Bool)

(assert (=> b!426147 m!415187))

(check-sat (not b_next!9949) (not b!426153) (not b!426145) tp_is_empty!11101 (not mapNonEmpty!18273) (not b!426152) (not b!426157) (not b!426147) (not b!426154) (not b!426146) (not start!39668) (not b!426149) (not b!426142) b_and!17619)
(check-sat b_and!17619 (not b_next!9949))
