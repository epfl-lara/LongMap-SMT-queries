; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39908 () Bool)

(assert start!39908)

(declare-fun b_free!10189 () Bool)

(declare-fun b_next!10189 () Bool)

(assert (=> start!39908 (= b_free!10189 (not b_next!10189))))

(declare-fun tp!36095 () Bool)

(declare-fun b_and!18051 () Bool)

(assert (=> start!39908 (= tp!36095 b_and!18051)))

(declare-fun b!433011 () Bool)

(declare-datatypes ((Unit!12809 0))(
  ( (Unit!12810) )
))
(declare-fun e!256062 () Unit!12809)

(declare-fun Unit!12811 () Unit!12809)

(assert (=> b!433011 (= e!256062 Unit!12811)))

(declare-fun b!433012 () Bool)

(declare-fun res!254824 () Bool)

(declare-fun e!256067 () Bool)

(assert (=> b!433012 (=> (not res!254824) (not e!256067))))

(declare-datatypes ((array!26518 0))(
  ( (array!26519 (arr!12708 (Array (_ BitVec 32) (_ BitVec 64))) (size!13060 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26518)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433012 (= res!254824 (or (= (select (arr!12708 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12708 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433013 () Bool)

(declare-fun res!254819 () Bool)

(assert (=> b!433013 (=> (not res!254819) (not e!256067))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26518 (_ BitVec 32)) Bool)

(assert (=> b!433013 (= res!254819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433014 () Bool)

(declare-fun res!254821 () Bool)

(assert (=> b!433014 (=> (not res!254821) (not e!256067))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433014 (= res!254821 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433015 () Bool)

(declare-fun e!256066 () Bool)

(declare-fun tp_is_empty!11341 () Bool)

(assert (=> b!433015 (= e!256066 tp_is_empty!11341)))

(declare-fun b!433016 () Bool)

(declare-fun e!256068 () Bool)

(declare-fun e!256060 () Bool)

(assert (=> b!433016 (= e!256068 e!256060)))

(declare-fun res!254831 () Bool)

(assert (=> b!433016 (=> res!254831 e!256060)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433016 (= res!254831 (= k0!794 (select (arr!12708 _keys!709) from!863)))))

(assert (=> b!433016 (not (= (select (arr!12708 _keys!709) from!863) k0!794))))

(declare-fun lt!198779 () Unit!12809)

(assert (=> b!433016 (= lt!198779 e!256062)))

(declare-fun c!55596 () Bool)

(assert (=> b!433016 (= c!55596 (= (select (arr!12708 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16227 0))(
  ( (V!16228 (val!5715 Int)) )
))
(declare-datatypes ((tuple2!7456 0))(
  ( (tuple2!7457 (_1!3739 (_ BitVec 64)) (_2!3739 V!16227)) )
))
(declare-datatypes ((List!7448 0))(
  ( (Nil!7445) (Cons!7444 (h!8300 tuple2!7456) (t!13078 List!7448)) )
))
(declare-datatypes ((ListLongMap!6371 0))(
  ( (ListLongMap!6372 (toList!3201 List!7448)) )
))
(declare-fun lt!198781 () ListLongMap!6371)

(declare-fun lt!198784 () ListLongMap!6371)

(assert (=> b!433016 (= lt!198781 lt!198784)))

(declare-fun lt!198782 () ListLongMap!6371)

(declare-fun lt!198777 () tuple2!7456)

(declare-fun +!1408 (ListLongMap!6371 tuple2!7456) ListLongMap!6371)

(assert (=> b!433016 (= lt!198784 (+!1408 lt!198782 lt!198777))))

(declare-fun lt!198775 () V!16227)

(assert (=> b!433016 (= lt!198777 (tuple2!7457 (select (arr!12708 _keys!709) from!863) lt!198775))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5327 0))(
  ( (ValueCellFull!5327 (v!7963 V!16227)) (EmptyCell!5327) )
))
(declare-datatypes ((array!26520 0))(
  ( (array!26521 (arr!12709 (Array (_ BitVec 32) ValueCell!5327)) (size!13061 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26520)

(declare-fun get!6329 (ValueCell!5327 V!16227) V!16227)

(declare-fun dynLambda!812 (Int (_ BitVec 64)) V!16227)

(assert (=> b!433016 (= lt!198775 (get!6329 (select (arr!12709 _values!549) from!863) (dynLambda!812 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433017 () Bool)

(declare-fun res!254829 () Bool)

(assert (=> b!433017 (=> (not res!254829) (not e!256067))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!433017 (= res!254829 (and (= (size!13061 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13060 _keys!709) (size!13061 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433018 () Bool)

(declare-fun e!256061 () Bool)

(declare-fun e!256069 () Bool)

(assert (=> b!433018 (= e!256061 e!256069)))

(declare-fun res!254825 () Bool)

(assert (=> b!433018 (=> (not res!254825) (not e!256069))))

(assert (=> b!433018 (= res!254825 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16227)

(declare-fun zeroValue!515 () V!16227)

(declare-fun lt!198789 () array!26520)

(declare-fun lt!198786 () array!26518)

(declare-fun getCurrentListMapNoExtraKeys!1438 (array!26518 array!26520 (_ BitVec 32) (_ BitVec 32) V!16227 V!16227 (_ BitVec 32) Int) ListLongMap!6371)

(assert (=> b!433018 (= lt!198781 (getCurrentListMapNoExtraKeys!1438 lt!198786 lt!198789 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16227)

(assert (=> b!433018 (= lt!198789 (array!26521 (store (arr!12709 _values!549) i!563 (ValueCellFull!5327 v!412)) (size!13061 _values!549)))))

(declare-fun lt!198785 () ListLongMap!6371)

(assert (=> b!433018 (= lt!198785 (getCurrentListMapNoExtraKeys!1438 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433019 () Bool)

(declare-fun res!254828 () Bool)

(assert (=> b!433019 (=> (not res!254828) (not e!256061))))

(assert (=> b!433019 (= res!254828 (bvsle from!863 i!563))))

(declare-fun b!433020 () Bool)

(declare-fun res!254832 () Bool)

(assert (=> b!433020 (=> (not res!254832) (not e!256061))))

(declare-datatypes ((List!7449 0))(
  ( (Nil!7446) (Cons!7445 (h!8301 (_ BitVec 64)) (t!13079 List!7449)) )
))
(declare-fun arrayNoDuplicates!0 (array!26518 (_ BitVec 32) List!7449) Bool)

(assert (=> b!433020 (= res!254832 (arrayNoDuplicates!0 lt!198786 #b00000000000000000000000000000000 Nil!7446))))

(declare-fun mapIsEmpty!18633 () Bool)

(declare-fun mapRes!18633 () Bool)

(assert (=> mapIsEmpty!18633 mapRes!18633))

(declare-fun mapNonEmpty!18633 () Bool)

(declare-fun tp!36096 () Bool)

(assert (=> mapNonEmpty!18633 (= mapRes!18633 (and tp!36096 e!256066))))

(declare-fun mapValue!18633 () ValueCell!5327)

(declare-fun mapKey!18633 () (_ BitVec 32))

(declare-fun mapRest!18633 () (Array (_ BitVec 32) ValueCell!5327))

(assert (=> mapNonEmpty!18633 (= (arr!12709 _values!549) (store mapRest!18633 mapKey!18633 mapValue!18633))))

(declare-fun b!433021 () Bool)

(assert (=> b!433021 (= e!256060 true)))

(declare-fun lt!198787 () ListLongMap!6371)

(declare-fun lt!198780 () tuple2!7456)

(assert (=> b!433021 (= lt!198784 (+!1408 (+!1408 lt!198787 lt!198777) lt!198780))))

(declare-fun lt!198788 () Unit!12809)

(declare-fun addCommutativeForDiffKeys!383 (ListLongMap!6371 (_ BitVec 64) V!16227 (_ BitVec 64) V!16227) Unit!12809)

(assert (=> b!433021 (= lt!198788 (addCommutativeForDiffKeys!383 lt!198787 k0!794 v!412 (select (arr!12708 _keys!709) from!863) lt!198775))))

(declare-fun b!433022 () Bool)

(declare-fun e!256064 () Bool)

(declare-fun e!256063 () Bool)

(assert (=> b!433022 (= e!256064 (and e!256063 mapRes!18633))))

(declare-fun condMapEmpty!18633 () Bool)

(declare-fun mapDefault!18633 () ValueCell!5327)

(assert (=> b!433022 (= condMapEmpty!18633 (= (arr!12709 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5327)) mapDefault!18633)))))

(declare-fun b!433023 () Bool)

(assert (=> b!433023 (= e!256063 tp_is_empty!11341)))

(declare-fun b!433024 () Bool)

(declare-fun Unit!12812 () Unit!12809)

(assert (=> b!433024 (= e!256062 Unit!12812)))

(declare-fun lt!198778 () Unit!12809)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26518 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12809)

(assert (=> b!433024 (= lt!198778 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433024 false))

(declare-fun b!433025 () Bool)

(assert (=> b!433025 (= e!256067 e!256061)))

(declare-fun res!254830 () Bool)

(assert (=> b!433025 (=> (not res!254830) (not e!256061))))

(assert (=> b!433025 (= res!254830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198786 mask!1025))))

(assert (=> b!433025 (= lt!198786 (array!26519 (store (arr!12708 _keys!709) i!563 k0!794) (size!13060 _keys!709)))))

(declare-fun b!433026 () Bool)

(declare-fun res!254826 () Bool)

(assert (=> b!433026 (=> (not res!254826) (not e!256067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433026 (= res!254826 (validMask!0 mask!1025))))

(declare-fun res!254822 () Bool)

(assert (=> start!39908 (=> (not res!254822) (not e!256067))))

(assert (=> start!39908 (= res!254822 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13060 _keys!709))))))

(assert (=> start!39908 e!256067))

(assert (=> start!39908 tp_is_empty!11341))

(assert (=> start!39908 tp!36095))

(assert (=> start!39908 true))

(declare-fun array_inv!9300 (array!26520) Bool)

(assert (=> start!39908 (and (array_inv!9300 _values!549) e!256064)))

(declare-fun array_inv!9301 (array!26518) Bool)

(assert (=> start!39908 (array_inv!9301 _keys!709)))

(declare-fun b!433027 () Bool)

(declare-fun res!254823 () Bool)

(assert (=> b!433027 (=> (not res!254823) (not e!256067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433027 (= res!254823 (validKeyInArray!0 k0!794))))

(declare-fun b!433028 () Bool)

(declare-fun res!254827 () Bool)

(assert (=> b!433028 (=> (not res!254827) (not e!256067))))

(assert (=> b!433028 (= res!254827 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13060 _keys!709))))))

(declare-fun b!433029 () Bool)

(declare-fun res!254820 () Bool)

(assert (=> b!433029 (=> (not res!254820) (not e!256067))))

(assert (=> b!433029 (= res!254820 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7446))))

(declare-fun b!433030 () Bool)

(assert (=> b!433030 (= e!256069 (not e!256068))))

(declare-fun res!254818 () Bool)

(assert (=> b!433030 (=> res!254818 e!256068)))

(assert (=> b!433030 (= res!254818 (not (validKeyInArray!0 (select (arr!12708 _keys!709) from!863))))))

(declare-fun lt!198776 () ListLongMap!6371)

(assert (=> b!433030 (= lt!198776 lt!198782)))

(assert (=> b!433030 (= lt!198782 (+!1408 lt!198787 lt!198780))))

(assert (=> b!433030 (= lt!198776 (getCurrentListMapNoExtraKeys!1438 lt!198786 lt!198789 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433030 (= lt!198780 (tuple2!7457 k0!794 v!412))))

(assert (=> b!433030 (= lt!198787 (getCurrentListMapNoExtraKeys!1438 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198783 () Unit!12809)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!577 (array!26518 array!26520 (_ BitVec 32) (_ BitVec 32) V!16227 V!16227 (_ BitVec 32) (_ BitVec 64) V!16227 (_ BitVec 32) Int) Unit!12809)

(assert (=> b!433030 (= lt!198783 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!577 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39908 res!254822) b!433026))

(assert (= (and b!433026 res!254826) b!433017))

(assert (= (and b!433017 res!254829) b!433013))

(assert (= (and b!433013 res!254819) b!433029))

(assert (= (and b!433029 res!254820) b!433028))

(assert (= (and b!433028 res!254827) b!433027))

(assert (= (and b!433027 res!254823) b!433012))

(assert (= (and b!433012 res!254824) b!433014))

(assert (= (and b!433014 res!254821) b!433025))

(assert (= (and b!433025 res!254830) b!433020))

(assert (= (and b!433020 res!254832) b!433019))

(assert (= (and b!433019 res!254828) b!433018))

(assert (= (and b!433018 res!254825) b!433030))

(assert (= (and b!433030 (not res!254818)) b!433016))

(assert (= (and b!433016 c!55596) b!433024))

(assert (= (and b!433016 (not c!55596)) b!433011))

(assert (= (and b!433016 (not res!254831)) b!433021))

(assert (= (and b!433022 condMapEmpty!18633) mapIsEmpty!18633))

(assert (= (and b!433022 (not condMapEmpty!18633)) mapNonEmpty!18633))

(get-info :version)

(assert (= (and mapNonEmpty!18633 ((_ is ValueCellFull!5327) mapValue!18633)) b!433015))

(assert (= (and b!433022 ((_ is ValueCellFull!5327) mapDefault!18633)) b!433023))

(assert (= start!39908 b!433022))

(declare-fun b_lambda!9299 () Bool)

(assert (=> (not b_lambda!9299) (not b!433016)))

(declare-fun t!13077 () Bool)

(declare-fun tb!3587 () Bool)

(assert (=> (and start!39908 (= defaultEntry!557 defaultEntry!557) t!13077) tb!3587))

(declare-fun result!6709 () Bool)

(assert (=> tb!3587 (= result!6709 tp_is_empty!11341)))

(assert (=> b!433016 t!13077))

(declare-fun b_and!18053 () Bool)

(assert (= b_and!18051 (and (=> t!13077 result!6709) b_and!18053)))

(declare-fun m!421319 () Bool)

(assert (=> b!433013 m!421319))

(declare-fun m!421321 () Bool)

(assert (=> b!433020 m!421321))

(declare-fun m!421323 () Bool)

(assert (=> b!433014 m!421323))

(declare-fun m!421325 () Bool)

(assert (=> b!433016 m!421325))

(declare-fun m!421327 () Bool)

(assert (=> b!433016 m!421327))

(declare-fun m!421329 () Bool)

(assert (=> b!433016 m!421329))

(declare-fun m!421331 () Bool)

(assert (=> b!433016 m!421331))

(assert (=> b!433016 m!421331))

(assert (=> b!433016 m!421329))

(declare-fun m!421333 () Bool)

(assert (=> b!433016 m!421333))

(assert (=> b!433030 m!421325))

(declare-fun m!421335 () Bool)

(assert (=> b!433030 m!421335))

(declare-fun m!421337 () Bool)

(assert (=> b!433030 m!421337))

(declare-fun m!421339 () Bool)

(assert (=> b!433030 m!421339))

(assert (=> b!433030 m!421325))

(declare-fun m!421341 () Bool)

(assert (=> b!433030 m!421341))

(declare-fun m!421343 () Bool)

(assert (=> b!433030 m!421343))

(declare-fun m!421345 () Bool)

(assert (=> b!433024 m!421345))

(declare-fun m!421347 () Bool)

(assert (=> b!433018 m!421347))

(declare-fun m!421349 () Bool)

(assert (=> b!433018 m!421349))

(declare-fun m!421351 () Bool)

(assert (=> b!433018 m!421351))

(declare-fun m!421353 () Bool)

(assert (=> mapNonEmpty!18633 m!421353))

(declare-fun m!421355 () Bool)

(assert (=> b!433012 m!421355))

(declare-fun m!421357 () Bool)

(assert (=> start!39908 m!421357))

(declare-fun m!421359 () Bool)

(assert (=> start!39908 m!421359))

(declare-fun m!421361 () Bool)

(assert (=> b!433021 m!421361))

(assert (=> b!433021 m!421361))

(declare-fun m!421363 () Bool)

(assert (=> b!433021 m!421363))

(assert (=> b!433021 m!421325))

(assert (=> b!433021 m!421325))

(declare-fun m!421365 () Bool)

(assert (=> b!433021 m!421365))

(declare-fun m!421367 () Bool)

(assert (=> b!433025 m!421367))

(declare-fun m!421369 () Bool)

(assert (=> b!433025 m!421369))

(declare-fun m!421371 () Bool)

(assert (=> b!433029 m!421371))

(declare-fun m!421373 () Bool)

(assert (=> b!433026 m!421373))

(declare-fun m!421375 () Bool)

(assert (=> b!433027 m!421375))

(check-sat (not b!433013) (not b!433029) (not b!433027) (not b_next!10189) (not b!433014) (not b!433030) (not b_lambda!9299) (not mapNonEmpty!18633) (not b!433020) (not b!433016) (not b!433018) (not b!433026) (not b!433021) (not b!433024) (not start!39908) (not b!433025) b_and!18053 tp_is_empty!11341)
(check-sat b_and!18053 (not b_next!10189))
