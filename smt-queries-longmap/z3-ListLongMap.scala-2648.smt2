; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39708 () Bool)

(assert start!39708)

(declare-fun b_free!9975 () Bool)

(declare-fun b_next!9975 () Bool)

(assert (=> start!39708 (= b_free!9975 (not b_next!9975))))

(declare-fun tp!35454 () Bool)

(declare-fun b_and!17631 () Bool)

(assert (=> start!39708 (= tp!35454 b_and!17631)))

(declare-fun b!426815 () Bool)

(declare-fun e!253169 () Bool)

(declare-fun tp_is_empty!11127 () Bool)

(assert (=> b!426815 (= e!253169 tp_is_empty!11127)))

(declare-fun mapIsEmpty!18312 () Bool)

(declare-fun mapRes!18312 () Bool)

(assert (=> mapIsEmpty!18312 mapRes!18312))

(declare-fun b!426816 () Bool)

(declare-fun e!253165 () Bool)

(declare-fun e!253168 () Bool)

(assert (=> b!426816 (= e!253165 e!253168)))

(declare-fun res!250213 () Bool)

(assert (=> b!426816 (=> (not res!250213) (not e!253168))))

(declare-datatypes ((array!26093 0))(
  ( (array!26094 (arr!12496 (Array (_ BitVec 32) (_ BitVec 64))) (size!12848 (_ BitVec 32))) )
))
(declare-fun lt!195082 () array!26093)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26093 (_ BitVec 32)) Bool)

(assert (=> b!426816 (= res!250213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195082 mask!1025))))

(declare-fun _keys!709 () array!26093)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426816 (= lt!195082 (array!26094 (store (arr!12496 _keys!709) i!563 k0!794) (size!12848 _keys!709)))))

(declare-fun b!426817 () Bool)

(declare-fun res!250203 () Bool)

(assert (=> b!426817 (=> (not res!250203) (not e!253168))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426817 (= res!250203 (bvsle from!863 i!563))))

(declare-fun b!426818 () Bool)

(declare-fun res!250214 () Bool)

(assert (=> b!426818 (=> (not res!250214) (not e!253168))))

(declare-datatypes ((List!7385 0))(
  ( (Nil!7382) (Cons!7381 (h!8237 (_ BitVec 64)) (t!12829 List!7385)) )
))
(declare-fun arrayNoDuplicates!0 (array!26093 (_ BitVec 32) List!7385) Bool)

(assert (=> b!426818 (= res!250214 (arrayNoDuplicates!0 lt!195082 #b00000000000000000000000000000000 Nil!7382))))

(declare-fun b!426819 () Bool)

(declare-fun res!250215 () Bool)

(assert (=> b!426819 (=> (not res!250215) (not e!253165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426819 (= res!250215 (validKeyInArray!0 k0!794))))

(declare-fun b!426820 () Bool)

(declare-fun res!250205 () Bool)

(assert (=> b!426820 (=> (not res!250205) (not e!253165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426820 (= res!250205 (validMask!0 mask!1025))))

(declare-fun b!426821 () Bool)

(declare-fun res!250212 () Bool)

(assert (=> b!426821 (=> (not res!250212) (not e!253165))))

(assert (=> b!426821 (= res!250212 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12848 _keys!709))))))

(declare-fun b!426822 () Bool)

(declare-fun res!250206 () Bool)

(assert (=> b!426822 (=> (not res!250206) (not e!253165))))

(assert (=> b!426822 (= res!250206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426823 () Bool)

(declare-fun e!253170 () Bool)

(assert (=> b!426823 (= e!253170 (and e!253169 mapRes!18312))))

(declare-fun condMapEmpty!18312 () Bool)

(declare-datatypes ((V!15941 0))(
  ( (V!15942 (val!5608 Int)) )
))
(declare-datatypes ((ValueCell!5220 0))(
  ( (ValueCellFull!5220 (v!7855 V!15941)) (EmptyCell!5220) )
))
(declare-datatypes ((array!26095 0))(
  ( (array!26096 (arr!12497 (Array (_ BitVec 32) ValueCell!5220)) (size!12849 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26095)

(declare-fun mapDefault!18312 () ValueCell!5220)

(assert (=> b!426823 (= condMapEmpty!18312 (= (arr!12497 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5220)) mapDefault!18312)))))

(declare-fun b!426824 () Bool)

(declare-fun res!250204 () Bool)

(assert (=> b!426824 (=> (not res!250204) (not e!253165))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!426824 (= res!250204 (and (= (size!12849 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12848 _keys!709) (size!12849 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!250209 () Bool)

(assert (=> start!39708 (=> (not res!250209) (not e!253165))))

(assert (=> start!39708 (= res!250209 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12848 _keys!709))))))

(assert (=> start!39708 e!253165))

(assert (=> start!39708 tp_is_empty!11127))

(assert (=> start!39708 tp!35454))

(assert (=> start!39708 true))

(declare-fun array_inv!9108 (array!26095) Bool)

(assert (=> start!39708 (and (array_inv!9108 _values!549) e!253170)))

(declare-fun array_inv!9109 (array!26093) Bool)

(assert (=> start!39708 (array_inv!9109 _keys!709)))

(declare-fun mapNonEmpty!18312 () Bool)

(declare-fun tp!35453 () Bool)

(declare-fun e!253166 () Bool)

(assert (=> mapNonEmpty!18312 (= mapRes!18312 (and tp!35453 e!253166))))

(declare-fun mapValue!18312 () ValueCell!5220)

(declare-fun mapKey!18312 () (_ BitVec 32))

(declare-fun mapRest!18312 () (Array (_ BitVec 32) ValueCell!5220))

(assert (=> mapNonEmpty!18312 (= (arr!12497 _values!549) (store mapRest!18312 mapKey!18312 mapValue!18312))))

(declare-fun b!426825 () Bool)

(declare-fun res!250207 () Bool)

(assert (=> b!426825 (=> (not res!250207) (not e!253165))))

(assert (=> b!426825 (= res!250207 (or (= (select (arr!12496 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12496 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426826 () Bool)

(assert (=> b!426826 (= e!253166 tp_is_empty!11127)))

(declare-fun b!426827 () Bool)

(declare-fun res!250210 () Bool)

(assert (=> b!426827 (=> (not res!250210) (not e!253165))))

(declare-fun arrayContainsKey!0 (array!26093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426827 (= res!250210 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426828 () Bool)

(declare-fun e!253167 () Bool)

(assert (=> b!426828 (= e!253168 e!253167)))

(declare-fun res!250211 () Bool)

(assert (=> b!426828 (=> (not res!250211) (not e!253167))))

(assert (=> b!426828 (= res!250211 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15941)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15941)

(declare-datatypes ((tuple2!7370 0))(
  ( (tuple2!7371 (_1!3696 (_ BitVec 64)) (_2!3696 V!15941)) )
))
(declare-datatypes ((List!7386 0))(
  ( (Nil!7383) (Cons!7382 (h!8238 tuple2!7370) (t!12830 List!7386)) )
))
(declare-datatypes ((ListLongMap!6283 0))(
  ( (ListLongMap!6284 (toList!3157 List!7386)) )
))
(declare-fun lt!195079 () ListLongMap!6283)

(declare-fun lt!195080 () array!26095)

(declare-fun getCurrentListMapNoExtraKeys!1361 (array!26093 array!26095 (_ BitVec 32) (_ BitVec 32) V!15941 V!15941 (_ BitVec 32) Int) ListLongMap!6283)

(assert (=> b!426828 (= lt!195079 (getCurrentListMapNoExtraKeys!1361 lt!195082 lt!195080 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15941)

(assert (=> b!426828 (= lt!195080 (array!26096 (store (arr!12497 _values!549) i!563 (ValueCellFull!5220 v!412)) (size!12849 _values!549)))))

(declare-fun lt!195081 () ListLongMap!6283)

(assert (=> b!426828 (= lt!195081 (getCurrentListMapNoExtraKeys!1361 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426829 () Bool)

(assert (=> b!426829 (= e!253167 (not true))))

(declare-fun +!1314 (ListLongMap!6283 tuple2!7370) ListLongMap!6283)

(assert (=> b!426829 (= (getCurrentListMapNoExtraKeys!1361 lt!195082 lt!195080 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1314 (getCurrentListMapNoExtraKeys!1361 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7371 k0!794 v!412)))))

(declare-datatypes ((Unit!12530 0))(
  ( (Unit!12531) )
))
(declare-fun lt!195083 () Unit!12530)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!509 (array!26093 array!26095 (_ BitVec 32) (_ BitVec 32) V!15941 V!15941 (_ BitVec 32) (_ BitVec 64) V!15941 (_ BitVec 32) Int) Unit!12530)

(assert (=> b!426829 (= lt!195083 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!509 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426830 () Bool)

(declare-fun res!250208 () Bool)

(assert (=> b!426830 (=> (not res!250208) (not e!253165))))

(assert (=> b!426830 (= res!250208 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7382))))

(assert (= (and start!39708 res!250209) b!426820))

(assert (= (and b!426820 res!250205) b!426824))

(assert (= (and b!426824 res!250204) b!426822))

(assert (= (and b!426822 res!250206) b!426830))

(assert (= (and b!426830 res!250208) b!426821))

(assert (= (and b!426821 res!250212) b!426819))

(assert (= (and b!426819 res!250215) b!426825))

(assert (= (and b!426825 res!250207) b!426827))

(assert (= (and b!426827 res!250210) b!426816))

(assert (= (and b!426816 res!250213) b!426818))

(assert (= (and b!426818 res!250214) b!426817))

(assert (= (and b!426817 res!250203) b!426828))

(assert (= (and b!426828 res!250211) b!426829))

(assert (= (and b!426823 condMapEmpty!18312) mapIsEmpty!18312))

(assert (= (and b!426823 (not condMapEmpty!18312)) mapNonEmpty!18312))

(get-info :version)

(assert (= (and mapNonEmpty!18312 ((_ is ValueCellFull!5220) mapValue!18312)) b!426826))

(assert (= (and b!426823 ((_ is ValueCellFull!5220) mapDefault!18312)) b!426815))

(assert (= start!39708 b!426823))

(declare-fun m!415427 () Bool)

(assert (=> b!426829 m!415427))

(declare-fun m!415429 () Bool)

(assert (=> b!426829 m!415429))

(assert (=> b!426829 m!415429))

(declare-fun m!415431 () Bool)

(assert (=> b!426829 m!415431))

(declare-fun m!415433 () Bool)

(assert (=> b!426829 m!415433))

(declare-fun m!415435 () Bool)

(assert (=> start!39708 m!415435))

(declare-fun m!415437 () Bool)

(assert (=> start!39708 m!415437))

(declare-fun m!415439 () Bool)

(assert (=> mapNonEmpty!18312 m!415439))

(declare-fun m!415441 () Bool)

(assert (=> b!426820 m!415441))

(declare-fun m!415443 () Bool)

(assert (=> b!426818 m!415443))

(declare-fun m!415445 () Bool)

(assert (=> b!426830 m!415445))

(declare-fun m!415447 () Bool)

(assert (=> b!426816 m!415447))

(declare-fun m!415449 () Bool)

(assert (=> b!426816 m!415449))

(declare-fun m!415451 () Bool)

(assert (=> b!426822 m!415451))

(declare-fun m!415453 () Bool)

(assert (=> b!426819 m!415453))

(declare-fun m!415455 () Bool)

(assert (=> b!426828 m!415455))

(declare-fun m!415457 () Bool)

(assert (=> b!426828 m!415457))

(declare-fun m!415459 () Bool)

(assert (=> b!426828 m!415459))

(declare-fun m!415461 () Bool)

(assert (=> b!426825 m!415461))

(declare-fun m!415463 () Bool)

(assert (=> b!426827 m!415463))

(check-sat (not b!426830) (not b!426829) (not b!426827) tp_is_empty!11127 (not b!426819) (not b!426828) (not start!39708) (not b!426816) (not b!426822) b_and!17631 (not b_next!9975) (not b!426820) (not mapNonEmpty!18312) (not b!426818))
(check-sat b_and!17631 (not b_next!9975))
