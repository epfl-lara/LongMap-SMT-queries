; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39936 () Bool)

(assert start!39936)

(declare-fun b_free!10203 () Bool)

(declare-fun b_next!10203 () Bool)

(assert (=> start!39936 (= b_free!10203 (not b_next!10203))))

(declare-fun tp!36138 () Bool)

(declare-fun b_and!18065 () Bool)

(assert (=> start!39936 (= tp!36138 b_and!18065)))

(declare-fun b!433494 () Bool)

(declare-fun res!255138 () Bool)

(declare-fun e!256310 () Bool)

(assert (=> b!433494 (=> (not res!255138) (not e!256310))))

(declare-datatypes ((array!26543 0))(
  ( (array!26544 (arr!12721 (Array (_ BitVec 32) (_ BitVec 64))) (size!13073 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26543 (_ BitVec 32)) Bool)

(assert (=> b!433494 (= res!255138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18654 () Bool)

(declare-fun mapRes!18654 () Bool)

(assert (=> mapIsEmpty!18654 mapRes!18654))

(declare-fun b!433495 () Bool)

(declare-fun res!255140 () Bool)

(declare-fun e!256305 () Bool)

(assert (=> b!433495 (=> (not res!255140) (not e!256305))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433495 (= res!255140 (bvsle from!863 i!563))))

(declare-fun b!433496 () Bool)

(declare-fun e!256309 () Bool)

(declare-fun tp_is_empty!11355 () Bool)

(assert (=> b!433496 (= e!256309 tp_is_empty!11355)))

(declare-fun b!433497 () Bool)

(declare-fun e!256303 () Bool)

(assert (=> b!433497 (= e!256303 true)))

(declare-datatypes ((V!16245 0))(
  ( (V!16246 (val!5722 Int)) )
))
(declare-datatypes ((tuple2!7562 0))(
  ( (tuple2!7563 (_1!3792 (_ BitVec 64)) (_2!3792 V!16245)) )
))
(declare-datatypes ((List!7571 0))(
  ( (Nil!7568) (Cons!7567 (h!8423 tuple2!7562) (t!13223 List!7571)) )
))
(declare-datatypes ((ListLongMap!6475 0))(
  ( (ListLongMap!6476 (toList!3253 List!7571)) )
))
(declare-fun lt!199075 () ListLongMap!6475)

(declare-fun lt!199073 () ListLongMap!6475)

(declare-fun lt!199071 () tuple2!7562)

(declare-fun lt!199084 () tuple2!7562)

(declare-fun +!1401 (ListLongMap!6475 tuple2!7562) ListLongMap!6475)

(assert (=> b!433497 (= lt!199075 (+!1401 (+!1401 lt!199073 lt!199071) lt!199084))))

(declare-fun lt!199077 () V!16245)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16245)

(declare-datatypes ((Unit!12832 0))(
  ( (Unit!12833) )
))
(declare-fun lt!199085 () Unit!12832)

(declare-fun addCommutativeForDiffKeys!390 (ListLongMap!6475 (_ BitVec 64) V!16245 (_ BitVec 64) V!16245) Unit!12832)

(assert (=> b!433497 (= lt!199085 (addCommutativeForDiffKeys!390 lt!199073 k0!794 v!412 (select (arr!12721 _keys!709) from!863) lt!199077))))

(declare-fun b!433498 () Bool)

(declare-fun res!255137 () Bool)

(assert (=> b!433498 (=> (not res!255137) (not e!256310))))

(declare-fun arrayContainsKey!0 (array!26543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433498 (= res!255137 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433499 () Bool)

(declare-fun e!256307 () Bool)

(declare-fun e!256308 () Bool)

(assert (=> b!433499 (= e!256307 (not e!256308))))

(declare-fun res!255136 () Bool)

(assert (=> b!433499 (=> res!255136 e!256308)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433499 (= res!255136 (not (validKeyInArray!0 (select (arr!12721 _keys!709) from!863))))))

(declare-fun lt!199083 () ListLongMap!6475)

(declare-fun lt!199079 () ListLongMap!6475)

(assert (=> b!433499 (= lt!199083 lt!199079)))

(assert (=> b!433499 (= lt!199079 (+!1401 lt!199073 lt!199084))))

(declare-fun minValue!515 () V!16245)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5334 0))(
  ( (ValueCellFull!5334 (v!7969 V!16245)) (EmptyCell!5334) )
))
(declare-datatypes ((array!26545 0))(
  ( (array!26546 (arr!12722 (Array (_ BitVec 32) ValueCell!5334)) (size!13074 (_ BitVec 32))) )
))
(declare-fun lt!199082 () array!26545)

(declare-fun zeroValue!515 () V!16245)

(declare-fun lt!199076 () array!26543)

(declare-fun getCurrentListMapNoExtraKeys!1449 (array!26543 array!26545 (_ BitVec 32) (_ BitVec 32) V!16245 V!16245 (_ BitVec 32) Int) ListLongMap!6475)

(assert (=> b!433499 (= lt!199083 (getCurrentListMapNoExtraKeys!1449 lt!199076 lt!199082 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433499 (= lt!199084 (tuple2!7563 k0!794 v!412))))

(declare-fun _values!549 () array!26545)

(assert (=> b!433499 (= lt!199073 (getCurrentListMapNoExtraKeys!1449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199078 () Unit!12832)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!581 (array!26543 array!26545 (_ BitVec 32) (_ BitVec 32) V!16245 V!16245 (_ BitVec 32) (_ BitVec 64) V!16245 (_ BitVec 32) Int) Unit!12832)

(assert (=> b!433499 (= lt!199078 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!581 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433500 () Bool)

(declare-fun res!255149 () Bool)

(assert (=> b!433500 (=> (not res!255149) (not e!256310))))

(assert (=> b!433500 (= res!255149 (validKeyInArray!0 k0!794))))

(declare-fun res!255142 () Bool)

(assert (=> start!39936 (=> (not res!255142) (not e!256310))))

(assert (=> start!39936 (= res!255142 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13073 _keys!709))))))

(assert (=> start!39936 e!256310))

(assert (=> start!39936 tp_is_empty!11355))

(assert (=> start!39936 tp!36138))

(assert (=> start!39936 true))

(declare-fun e!256302 () Bool)

(declare-fun array_inv!9258 (array!26545) Bool)

(assert (=> start!39936 (and (array_inv!9258 _values!549) e!256302)))

(declare-fun array_inv!9259 (array!26543) Bool)

(assert (=> start!39936 (array_inv!9259 _keys!709)))

(declare-fun b!433501 () Bool)

(declare-fun res!255146 () Bool)

(assert (=> b!433501 (=> (not res!255146) (not e!256310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433501 (= res!255146 (validMask!0 mask!1025))))

(declare-fun b!433502 () Bool)

(declare-fun e!256306 () Unit!12832)

(declare-fun Unit!12834 () Unit!12832)

(assert (=> b!433502 (= e!256306 Unit!12834)))

(declare-fun lt!199080 () Unit!12832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12832)

(assert (=> b!433502 (= lt!199080 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433502 false))

(declare-fun b!433503 () Bool)

(declare-fun res!255141 () Bool)

(assert (=> b!433503 (=> (not res!255141) (not e!256310))))

(declare-datatypes ((List!7572 0))(
  ( (Nil!7569) (Cons!7568 (h!8424 (_ BitVec 64)) (t!13224 List!7572)) )
))
(declare-fun arrayNoDuplicates!0 (array!26543 (_ BitVec 32) List!7572) Bool)

(assert (=> b!433503 (= res!255141 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7569))))

(declare-fun mapNonEmpty!18654 () Bool)

(declare-fun tp!36137 () Bool)

(assert (=> mapNonEmpty!18654 (= mapRes!18654 (and tp!36137 e!256309))))

(declare-fun mapKey!18654 () (_ BitVec 32))

(declare-fun mapRest!18654 () (Array (_ BitVec 32) ValueCell!5334))

(declare-fun mapValue!18654 () ValueCell!5334)

(assert (=> mapNonEmpty!18654 (= (arr!12722 _values!549) (store mapRest!18654 mapKey!18654 mapValue!18654))))

(declare-fun b!433504 () Bool)

(declare-fun e!256304 () Bool)

(assert (=> b!433504 (= e!256302 (and e!256304 mapRes!18654))))

(declare-fun condMapEmpty!18654 () Bool)

(declare-fun mapDefault!18654 () ValueCell!5334)

(assert (=> b!433504 (= condMapEmpty!18654 (= (arr!12722 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5334)) mapDefault!18654)))))

(declare-fun b!433505 () Bool)

(declare-fun res!255148 () Bool)

(assert (=> b!433505 (=> (not res!255148) (not e!256310))))

(assert (=> b!433505 (= res!255148 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13073 _keys!709))))))

(declare-fun b!433506 () Bool)

(declare-fun res!255150 () Bool)

(assert (=> b!433506 (=> (not res!255150) (not e!256310))))

(assert (=> b!433506 (= res!255150 (and (= (size!13074 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13073 _keys!709) (size!13074 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433507 () Bool)

(declare-fun res!255143 () Bool)

(assert (=> b!433507 (=> (not res!255143) (not e!256305))))

(assert (=> b!433507 (= res!255143 (arrayNoDuplicates!0 lt!199076 #b00000000000000000000000000000000 Nil!7569))))

(declare-fun b!433508 () Bool)

(assert (=> b!433508 (= e!256310 e!256305)))

(declare-fun res!255147 () Bool)

(assert (=> b!433508 (=> (not res!255147) (not e!256305))))

(assert (=> b!433508 (= res!255147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199076 mask!1025))))

(assert (=> b!433508 (= lt!199076 (array!26544 (store (arr!12721 _keys!709) i!563 k0!794) (size!13073 _keys!709)))))

(declare-fun b!433509 () Bool)

(assert (=> b!433509 (= e!256308 e!256303)))

(declare-fun res!255145 () Bool)

(assert (=> b!433509 (=> res!255145 e!256303)))

(assert (=> b!433509 (= res!255145 (= k0!794 (select (arr!12721 _keys!709) from!863)))))

(assert (=> b!433509 (not (= (select (arr!12721 _keys!709) from!863) k0!794))))

(declare-fun lt!199081 () Unit!12832)

(assert (=> b!433509 (= lt!199081 e!256306)))

(declare-fun c!55640 () Bool)

(assert (=> b!433509 (= c!55640 (= (select (arr!12721 _keys!709) from!863) k0!794))))

(declare-fun lt!199072 () ListLongMap!6475)

(assert (=> b!433509 (= lt!199072 lt!199075)))

(assert (=> b!433509 (= lt!199075 (+!1401 lt!199079 lt!199071))))

(assert (=> b!433509 (= lt!199071 (tuple2!7563 (select (arr!12721 _keys!709) from!863) lt!199077))))

(declare-fun get!6329 (ValueCell!5334 V!16245) V!16245)

(declare-fun dynLambda!814 (Int (_ BitVec 64)) V!16245)

(assert (=> b!433509 (= lt!199077 (get!6329 (select (arr!12722 _values!549) from!863) (dynLambda!814 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433510 () Bool)

(declare-fun res!255139 () Bool)

(assert (=> b!433510 (=> (not res!255139) (not e!256310))))

(assert (=> b!433510 (= res!255139 (or (= (select (arr!12721 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12721 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433511 () Bool)

(assert (=> b!433511 (= e!256305 e!256307)))

(declare-fun res!255144 () Bool)

(assert (=> b!433511 (=> (not res!255144) (not e!256307))))

(assert (=> b!433511 (= res!255144 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433511 (= lt!199072 (getCurrentListMapNoExtraKeys!1449 lt!199076 lt!199082 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433511 (= lt!199082 (array!26546 (store (arr!12722 _values!549) i!563 (ValueCellFull!5334 v!412)) (size!13074 _values!549)))))

(declare-fun lt!199074 () ListLongMap!6475)

(assert (=> b!433511 (= lt!199074 (getCurrentListMapNoExtraKeys!1449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433512 () Bool)

(assert (=> b!433512 (= e!256304 tp_is_empty!11355)))

(declare-fun b!433513 () Bool)

(declare-fun Unit!12835 () Unit!12832)

(assert (=> b!433513 (= e!256306 Unit!12835)))

(assert (= (and start!39936 res!255142) b!433501))

(assert (= (and b!433501 res!255146) b!433506))

(assert (= (and b!433506 res!255150) b!433494))

(assert (= (and b!433494 res!255138) b!433503))

(assert (= (and b!433503 res!255141) b!433505))

(assert (= (and b!433505 res!255148) b!433500))

(assert (= (and b!433500 res!255149) b!433510))

(assert (= (and b!433510 res!255139) b!433498))

(assert (= (and b!433498 res!255137) b!433508))

(assert (= (and b!433508 res!255147) b!433507))

(assert (= (and b!433507 res!255143) b!433495))

(assert (= (and b!433495 res!255140) b!433511))

(assert (= (and b!433511 res!255144) b!433499))

(assert (= (and b!433499 (not res!255136)) b!433509))

(assert (= (and b!433509 c!55640) b!433502))

(assert (= (and b!433509 (not c!55640)) b!433513))

(assert (= (and b!433509 (not res!255145)) b!433497))

(assert (= (and b!433504 condMapEmpty!18654) mapIsEmpty!18654))

(assert (= (and b!433504 (not condMapEmpty!18654)) mapNonEmpty!18654))

(get-info :version)

(assert (= (and mapNonEmpty!18654 ((_ is ValueCellFull!5334) mapValue!18654)) b!433496))

(assert (= (and b!433504 ((_ is ValueCellFull!5334) mapDefault!18654)) b!433512))

(assert (= start!39936 b!433504))

(declare-fun b_lambda!9291 () Bool)

(assert (=> (not b_lambda!9291) (not b!433509)))

(declare-fun t!13222 () Bool)

(declare-fun tb!3609 () Bool)

(assert (=> (and start!39936 (= defaultEntry!557 defaultEntry!557) t!13222) tb!3609))

(declare-fun result!6745 () Bool)

(assert (=> tb!3609 (= result!6745 tp_is_empty!11355)))

(assert (=> b!433509 t!13222))

(declare-fun b_and!18067 () Bool)

(assert (= b_and!18065 (and (=> t!13222 result!6745) b_and!18067)))

(declare-fun m!421507 () Bool)

(assert (=> mapNonEmpty!18654 m!421507))

(declare-fun m!421509 () Bool)

(assert (=> b!433498 m!421509))

(declare-fun m!421511 () Bool)

(assert (=> b!433510 m!421511))

(declare-fun m!421513 () Bool)

(assert (=> b!433494 m!421513))

(declare-fun m!421515 () Bool)

(assert (=> b!433507 m!421515))

(declare-fun m!421517 () Bool)

(assert (=> b!433508 m!421517))

(declare-fun m!421519 () Bool)

(assert (=> b!433508 m!421519))

(declare-fun m!421521 () Bool)

(assert (=> b!433500 m!421521))

(declare-fun m!421523 () Bool)

(assert (=> b!433499 m!421523))

(declare-fun m!421525 () Bool)

(assert (=> b!433499 m!421525))

(declare-fun m!421527 () Bool)

(assert (=> b!433499 m!421527))

(declare-fun m!421529 () Bool)

(assert (=> b!433499 m!421529))

(assert (=> b!433499 m!421523))

(declare-fun m!421531 () Bool)

(assert (=> b!433499 m!421531))

(declare-fun m!421533 () Bool)

(assert (=> b!433499 m!421533))

(declare-fun m!421535 () Bool)

(assert (=> b!433497 m!421535))

(assert (=> b!433497 m!421535))

(declare-fun m!421537 () Bool)

(assert (=> b!433497 m!421537))

(assert (=> b!433497 m!421523))

(assert (=> b!433497 m!421523))

(declare-fun m!421539 () Bool)

(assert (=> b!433497 m!421539))

(assert (=> b!433509 m!421523))

(declare-fun m!421541 () Bool)

(assert (=> b!433509 m!421541))

(declare-fun m!421543 () Bool)

(assert (=> b!433509 m!421543))

(declare-fun m!421545 () Bool)

(assert (=> b!433509 m!421545))

(assert (=> b!433509 m!421545))

(assert (=> b!433509 m!421541))

(declare-fun m!421547 () Bool)

(assert (=> b!433509 m!421547))

(declare-fun m!421549 () Bool)

(assert (=> b!433511 m!421549))

(declare-fun m!421551 () Bool)

(assert (=> b!433511 m!421551))

(declare-fun m!421553 () Bool)

(assert (=> b!433511 m!421553))

(declare-fun m!421555 () Bool)

(assert (=> b!433501 m!421555))

(declare-fun m!421557 () Bool)

(assert (=> b!433502 m!421557))

(declare-fun m!421559 () Bool)

(assert (=> b!433503 m!421559))

(declare-fun m!421561 () Bool)

(assert (=> start!39936 m!421561))

(declare-fun m!421563 () Bool)

(assert (=> start!39936 m!421563))

(check-sat (not mapNonEmpty!18654) (not b_next!10203) (not b!433502) (not b!433511) (not b!433500) (not b!433507) (not b!433497) tp_is_empty!11355 (not start!39936) (not b!433508) b_and!18067 (not b!433494) (not b_lambda!9291) (not b!433503) (not b!433498) (not b!433509) (not b!433499) (not b!433501))
(check-sat b_and!18067 (not b_next!10203))
