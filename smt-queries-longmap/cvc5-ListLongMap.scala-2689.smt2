; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39952 () Bool)

(assert start!39952)

(declare-fun b_free!10219 () Bool)

(declare-fun b_next!10219 () Bool)

(assert (=> start!39952 (= b_free!10219 (not b_next!10219))))

(declare-fun tp!36185 () Bool)

(declare-fun b_and!18097 () Bool)

(assert (=> start!39952 (= tp!36185 b_and!18097)))

(declare-fun b!433990 () Bool)

(declare-datatypes ((Unit!12859 0))(
  ( (Unit!12860) )
))
(declare-fun e!256545 () Unit!12859)

(declare-fun Unit!12861 () Unit!12859)

(assert (=> b!433990 (= e!256545 Unit!12861)))

(declare-fun b!433991 () Bool)

(declare-fun res!255503 () Bool)

(declare-fun e!256550 () Bool)

(assert (=> b!433991 (=> (not res!255503) (not e!256550))))

(declare-datatypes ((array!26575 0))(
  ( (array!26576 (arr!12737 (Array (_ BitVec 32) (_ BitVec 64))) (size!13089 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26575)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26575 (_ BitVec 32)) Bool)

(assert (=> b!433991 (= res!255503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433992 () Bool)

(declare-fun res!255497 () Bool)

(assert (=> b!433992 (=> (not res!255497) (not e!256550))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16267 0))(
  ( (V!16268 (val!5730 Int)) )
))
(declare-datatypes ((ValueCell!5342 0))(
  ( (ValueCellFull!5342 (v!7977 V!16267)) (EmptyCell!5342) )
))
(declare-datatypes ((array!26577 0))(
  ( (array!26578 (arr!12738 (Array (_ BitVec 32) ValueCell!5342)) (size!13090 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26577)

(assert (=> b!433992 (= res!255497 (and (= (size!13090 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13089 _keys!709) (size!13090 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433993 () Bool)

(declare-fun e!256548 () Bool)

(declare-fun tp_is_empty!11371 () Bool)

(assert (=> b!433993 (= e!256548 tp_is_empty!11371)))

(declare-fun b!433994 () Bool)

(declare-fun e!256549 () Bool)

(declare-fun e!256546 () Bool)

(assert (=> b!433994 (= e!256549 (not e!256546))))

(declare-fun res!255501 () Bool)

(assert (=> b!433994 (=> res!255501 e!256546)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433994 (= res!255501 (not (validKeyInArray!0 (select (arr!12737 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7578 0))(
  ( (tuple2!7579 (_1!3800 (_ BitVec 64)) (_2!3800 V!16267)) )
))
(declare-datatypes ((List!7584 0))(
  ( (Nil!7581) (Cons!7580 (h!8436 tuple2!7578) (t!13252 List!7584)) )
))
(declare-datatypes ((ListLongMap!6491 0))(
  ( (ListLongMap!6492 (toList!3261 List!7584)) )
))
(declare-fun lt!199443 () ListLongMap!6491)

(declare-fun lt!199434 () ListLongMap!6491)

(assert (=> b!433994 (= lt!199443 lt!199434)))

(declare-fun lt!199440 () ListLongMap!6491)

(declare-fun lt!199431 () tuple2!7578)

(declare-fun +!1409 (ListLongMap!6491 tuple2!7578) ListLongMap!6491)

(assert (=> b!433994 (= lt!199434 (+!1409 lt!199440 lt!199431))))

(declare-fun minValue!515 () V!16267)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16267)

(declare-fun lt!199439 () array!26577)

(declare-fun lt!199432 () array!26575)

(declare-fun getCurrentListMapNoExtraKeys!1455 (array!26575 array!26577 (_ BitVec 32) (_ BitVec 32) V!16267 V!16267 (_ BitVec 32) Int) ListLongMap!6491)

(assert (=> b!433994 (= lt!199443 (getCurrentListMapNoExtraKeys!1455 lt!199432 lt!199439 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16267)

(assert (=> b!433994 (= lt!199431 (tuple2!7579 k!794 v!412))))

(assert (=> b!433994 (= lt!199440 (getCurrentListMapNoExtraKeys!1455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199436 () Unit!12859)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!586 (array!26575 array!26577 (_ BitVec 32) (_ BitVec 32) V!16267 V!16267 (_ BitVec 32) (_ BitVec 64) V!16267 (_ BitVec 32) Int) Unit!12859)

(assert (=> b!433994 (= lt!199436 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433995 () Bool)

(declare-fun e!256542 () Bool)

(assert (=> b!433995 (= e!256542 tp_is_empty!11371)))

(declare-fun b!433996 () Bool)

(declare-fun e!256543 () Bool)

(assert (=> b!433996 (= e!256546 e!256543)))

(declare-fun res!255496 () Bool)

(assert (=> b!433996 (=> res!255496 e!256543)))

(assert (=> b!433996 (= res!255496 (= k!794 (select (arr!12737 _keys!709) from!863)))))

(assert (=> b!433996 (not (= (select (arr!12737 _keys!709) from!863) k!794))))

(declare-fun lt!199441 () Unit!12859)

(assert (=> b!433996 (= lt!199441 e!256545)))

(declare-fun c!55664 () Bool)

(assert (=> b!433996 (= c!55664 (= (select (arr!12737 _keys!709) from!863) k!794))))

(declare-fun lt!199437 () ListLongMap!6491)

(declare-fun lt!199445 () ListLongMap!6491)

(assert (=> b!433996 (= lt!199437 lt!199445)))

(declare-fun lt!199442 () tuple2!7578)

(assert (=> b!433996 (= lt!199445 (+!1409 lt!199434 lt!199442))))

(declare-fun lt!199433 () V!16267)

(assert (=> b!433996 (= lt!199442 (tuple2!7579 (select (arr!12737 _keys!709) from!863) lt!199433))))

(declare-fun get!6341 (ValueCell!5342 V!16267) V!16267)

(declare-fun dynLambda!820 (Int (_ BitVec 64)) V!16267)

(assert (=> b!433996 (= lt!199433 (get!6341 (select (arr!12738 _values!549) from!863) (dynLambda!820 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18678 () Bool)

(declare-fun mapRes!18678 () Bool)

(declare-fun tp!36186 () Bool)

(assert (=> mapNonEmpty!18678 (= mapRes!18678 (and tp!36186 e!256548))))

(declare-fun mapKey!18678 () (_ BitVec 32))

(declare-fun mapRest!18678 () (Array (_ BitVec 32) ValueCell!5342))

(declare-fun mapValue!18678 () ValueCell!5342)

(assert (=> mapNonEmpty!18678 (= (arr!12738 _values!549) (store mapRest!18678 mapKey!18678 mapValue!18678))))

(declare-fun b!433998 () Bool)

(declare-fun e!256544 () Bool)

(assert (=> b!433998 (= e!256544 e!256549)))

(declare-fun res!255507 () Bool)

(assert (=> b!433998 (=> (not res!255507) (not e!256549))))

(assert (=> b!433998 (= res!255507 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433998 (= lt!199437 (getCurrentListMapNoExtraKeys!1455 lt!199432 lt!199439 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433998 (= lt!199439 (array!26578 (store (arr!12738 _values!549) i!563 (ValueCellFull!5342 v!412)) (size!13090 _values!549)))))

(declare-fun lt!199435 () ListLongMap!6491)

(assert (=> b!433998 (= lt!199435 (getCurrentListMapNoExtraKeys!1455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433999 () Bool)

(declare-fun res!255500 () Bool)

(assert (=> b!433999 (=> (not res!255500) (not e!256550))))

(assert (=> b!433999 (= res!255500 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13089 _keys!709))))))

(declare-fun b!434000 () Bool)

(assert (=> b!434000 (= e!256550 e!256544)))

(declare-fun res!255508 () Bool)

(assert (=> b!434000 (=> (not res!255508) (not e!256544))))

(assert (=> b!434000 (= res!255508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199432 mask!1025))))

(assert (=> b!434000 (= lt!199432 (array!26576 (store (arr!12737 _keys!709) i!563 k!794) (size!13089 _keys!709)))))

(declare-fun b!434001 () Bool)

(declare-fun res!255505 () Bool)

(assert (=> b!434001 (=> (not res!255505) (not e!256550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434001 (= res!255505 (validMask!0 mask!1025))))

(declare-fun b!434002 () Bool)

(declare-fun res!255498 () Bool)

(assert (=> b!434002 (=> (not res!255498) (not e!256550))))

(assert (=> b!434002 (= res!255498 (or (= (select (arr!12737 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12737 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434003 () Bool)

(declare-fun e!256551 () Bool)

(assert (=> b!434003 (= e!256551 (and e!256542 mapRes!18678))))

(declare-fun condMapEmpty!18678 () Bool)

(declare-fun mapDefault!18678 () ValueCell!5342)

