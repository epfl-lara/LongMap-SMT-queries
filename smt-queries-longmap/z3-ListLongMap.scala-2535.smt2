; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39014 () Bool)

(assert start!39014)

(declare-fun b_free!9295 () Bool)

(declare-fun b_next!9295 () Bool)

(assert (=> start!39014 (= b_free!9295 (not b_next!9295))))

(declare-fun tp!33414 () Bool)

(declare-fun b_and!16695 () Bool)

(assert (=> start!39014 (= tp!33414 b_and!16695)))

(declare-fun mapIsEmpty!17292 () Bool)

(declare-fun mapRes!17292 () Bool)

(assert (=> mapIsEmpty!17292 mapRes!17292))

(declare-fun b!409193 () Bool)

(declare-fun res!236936 () Bool)

(declare-fun e!245499 () Bool)

(assert (=> b!409193 (=> (not res!236936) (not e!245499))))

(declare-datatypes ((array!24766 0))(
  ( (array!24767 (arr!11832 (Array (_ BitVec 32) (_ BitVec 64))) (size!12184 (_ BitVec 32))) )
))
(declare-fun lt!188940 () array!24766)

(declare-datatypes ((List!6720 0))(
  ( (Nil!6717) (Cons!6716 (h!7572 (_ BitVec 64)) (t!11886 List!6720)) )
))
(declare-fun arrayNoDuplicates!0 (array!24766 (_ BitVec 32) List!6720) Bool)

(assert (=> b!409193 (= res!236936 (arrayNoDuplicates!0 lt!188940 #b00000000000000000000000000000000 Nil!6717))))

(declare-fun b!409194 () Bool)

(declare-fun e!245500 () Bool)

(declare-fun tp_is_empty!10447 () Bool)

(assert (=> b!409194 (= e!245500 tp_is_empty!10447)))

(declare-fun mapNonEmpty!17292 () Bool)

(declare-fun tp!33413 () Bool)

(assert (=> mapNonEmpty!17292 (= mapRes!17292 (and tp!33413 e!245500))))

(declare-datatypes ((V!15035 0))(
  ( (V!15036 (val!5268 Int)) )
))
(declare-datatypes ((ValueCell!4880 0))(
  ( (ValueCellFull!4880 (v!7516 V!15035)) (EmptyCell!4880) )
))
(declare-fun mapValue!17292 () ValueCell!4880)

(declare-datatypes ((array!24768 0))(
  ( (array!24769 (arr!11833 (Array (_ BitVec 32) ValueCell!4880)) (size!12185 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24768)

(declare-fun mapKey!17292 () (_ BitVec 32))

(declare-fun mapRest!17292 () (Array (_ BitVec 32) ValueCell!4880))

(assert (=> mapNonEmpty!17292 (= (arr!11833 _values!549) (store mapRest!17292 mapKey!17292 mapValue!17292))))

(declare-fun b!409195 () Bool)

(declare-fun res!236930 () Bool)

(declare-fun e!245495 () Bool)

(assert (=> b!409195 (=> (not res!236930) (not e!245495))))

(declare-fun _keys!709 () array!24766)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409195 (= res!236930 (or (= (select (arr!11832 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11832 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409196 () Bool)

(declare-fun e!245496 () Bool)

(declare-fun e!245498 () Bool)

(assert (=> b!409196 (= e!245496 (and e!245498 mapRes!17292))))

(declare-fun condMapEmpty!17292 () Bool)

(declare-fun mapDefault!17292 () ValueCell!4880)

(assert (=> b!409196 (= condMapEmpty!17292 (= (arr!11833 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4880)) mapDefault!17292)))))

(declare-fun res!236931 () Bool)

(assert (=> start!39014 (=> (not res!236931) (not e!245495))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39014 (= res!236931 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12184 _keys!709))))))

(assert (=> start!39014 e!245495))

(assert (=> start!39014 tp_is_empty!10447))

(assert (=> start!39014 tp!33414))

(assert (=> start!39014 true))

(declare-fun array_inv!8718 (array!24768) Bool)

(assert (=> start!39014 (and (array_inv!8718 _values!549) e!245496)))

(declare-fun array_inv!8719 (array!24766) Bool)

(assert (=> start!39014 (array_inv!8719 _keys!709)))

(declare-fun b!409197 () Bool)

(declare-fun res!236937 () Bool)

(assert (=> b!409197 (=> (not res!236937) (not e!245495))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409197 (= res!236937 (validMask!0 mask!1025))))

(declare-fun b!409198 () Bool)

(declare-fun res!236939 () Bool)

(assert (=> b!409198 (=> (not res!236939) (not e!245495))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409198 (= res!236939 (and (= (size!12185 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12184 _keys!709) (size!12185 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409199 () Bool)

(declare-fun res!236940 () Bool)

(assert (=> b!409199 (=> (not res!236940) (not e!245499))))

(assert (=> b!409199 (= res!236940 (bvsle from!863 i!563))))

(declare-fun b!409200 () Bool)

(declare-fun res!236934 () Bool)

(assert (=> b!409200 (=> (not res!236934) (not e!245495))))

(assert (=> b!409200 (= res!236934 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6717))))

(declare-fun b!409201 () Bool)

(declare-fun res!236935 () Bool)

(assert (=> b!409201 (=> (not res!236935) (not e!245495))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409201 (= res!236935 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409202 () Bool)

(assert (=> b!409202 (= e!245498 tp_is_empty!10447)))

(declare-fun b!409203 () Bool)

(declare-fun res!236933 () Bool)

(assert (=> b!409203 (=> (not res!236933) (not e!245495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24766 (_ BitVec 32)) Bool)

(assert (=> b!409203 (= res!236933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409204 () Bool)

(assert (=> b!409204 (= e!245495 e!245499)))

(declare-fun res!236932 () Bool)

(assert (=> b!409204 (=> (not res!236932) (not e!245499))))

(assert (=> b!409204 (= res!236932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188940 mask!1025))))

(assert (=> b!409204 (= lt!188940 (array!24767 (store (arr!11832 _keys!709) i!563 k0!794) (size!12184 _keys!709)))))

(declare-fun b!409205 () Bool)

(declare-fun res!236929 () Bool)

(assert (=> b!409205 (=> (not res!236929) (not e!245495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409205 (= res!236929 (validKeyInArray!0 k0!794))))

(declare-fun b!409206 () Bool)

(assert (=> b!409206 (= e!245499 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15035)

(declare-datatypes ((tuple2!6702 0))(
  ( (tuple2!6703 (_1!3362 (_ BitVec 64)) (_2!3362 V!15035)) )
))
(declare-datatypes ((List!6721 0))(
  ( (Nil!6718) (Cons!6717 (h!7573 tuple2!6702) (t!11887 List!6721)) )
))
(declare-datatypes ((ListLongMap!5617 0))(
  ( (ListLongMap!5618 (toList!2824 List!6721)) )
))
(declare-fun lt!188939 () ListLongMap!5617)

(declare-fun minValue!515 () V!15035)

(declare-fun getCurrentListMapNoExtraKeys!1076 (array!24766 array!24768 (_ BitVec 32) (_ BitVec 32) V!15035 V!15035 (_ BitVec 32) Int) ListLongMap!5617)

(assert (=> b!409206 (= lt!188939 (getCurrentListMapNoExtraKeys!1076 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409207 () Bool)

(declare-fun res!236938 () Bool)

(assert (=> b!409207 (=> (not res!236938) (not e!245495))))

(assert (=> b!409207 (= res!236938 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12184 _keys!709))))))

(assert (= (and start!39014 res!236931) b!409197))

(assert (= (and b!409197 res!236937) b!409198))

(assert (= (and b!409198 res!236939) b!409203))

(assert (= (and b!409203 res!236933) b!409200))

(assert (= (and b!409200 res!236934) b!409207))

(assert (= (and b!409207 res!236938) b!409205))

(assert (= (and b!409205 res!236929) b!409195))

(assert (= (and b!409195 res!236930) b!409201))

(assert (= (and b!409201 res!236935) b!409204))

(assert (= (and b!409204 res!236932) b!409193))

(assert (= (and b!409193 res!236936) b!409199))

(assert (= (and b!409199 res!236940) b!409206))

(assert (= (and b!409196 condMapEmpty!17292) mapIsEmpty!17292))

(assert (= (and b!409196 (not condMapEmpty!17292)) mapNonEmpty!17292))

(get-info :version)

(assert (= (and mapNonEmpty!17292 ((_ is ValueCellFull!4880) mapValue!17292)) b!409194))

(assert (= (and b!409196 ((_ is ValueCellFull!4880) mapDefault!17292)) b!409202))

(assert (= start!39014 b!409196))

(declare-fun m!400461 () Bool)

(assert (=> b!409205 m!400461))

(declare-fun m!400463 () Bool)

(assert (=> b!409204 m!400463))

(declare-fun m!400465 () Bool)

(assert (=> b!409204 m!400465))

(declare-fun m!400467 () Bool)

(assert (=> b!409193 m!400467))

(declare-fun m!400469 () Bool)

(assert (=> b!409203 m!400469))

(declare-fun m!400471 () Bool)

(assert (=> b!409201 m!400471))

(declare-fun m!400473 () Bool)

(assert (=> b!409195 m!400473))

(declare-fun m!400475 () Bool)

(assert (=> b!409206 m!400475))

(declare-fun m!400477 () Bool)

(assert (=> b!409200 m!400477))

(declare-fun m!400479 () Bool)

(assert (=> start!39014 m!400479))

(declare-fun m!400481 () Bool)

(assert (=> start!39014 m!400481))

(declare-fun m!400483 () Bool)

(assert (=> b!409197 m!400483))

(declare-fun m!400485 () Bool)

(assert (=> mapNonEmpty!17292 m!400485))

(check-sat b_and!16695 (not start!39014) tp_is_empty!10447 (not b!409204) (not b!409197) (not b!409200) (not b!409201) (not b!409206) (not b!409203) (not b!409193) (not b_next!9295) (not b!409205) (not mapNonEmpty!17292))
(check-sat b_and!16695 (not b_next!9295))
