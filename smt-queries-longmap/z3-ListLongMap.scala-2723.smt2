; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40142 () Bool)

(assert start!40142)

(declare-fun b_free!10423 () Bool)

(declare-fun b_next!10423 () Bool)

(assert (=> start!40142 (= b_free!10423 (not b_next!10423))))

(declare-fun tp!36798 () Bool)

(declare-fun b_and!18405 () Bool)

(assert (=> start!40142 (= tp!36798 b_and!18405)))

(declare-fun mapNonEmpty!18984 () Bool)

(declare-fun mapRes!18984 () Bool)

(declare-fun tp!36797 () Bool)

(declare-fun e!259053 () Bool)

(assert (=> mapNonEmpty!18984 (= mapRes!18984 (and tp!36797 e!259053))))

(declare-datatypes ((V!16539 0))(
  ( (V!16540 (val!5832 Int)) )
))
(declare-datatypes ((ValueCell!5444 0))(
  ( (ValueCellFull!5444 (v!8080 V!16539)) (EmptyCell!5444) )
))
(declare-fun mapValue!18984 () ValueCell!5444)

(declare-datatypes ((array!26972 0))(
  ( (array!26973 (arr!12935 (Array (_ BitVec 32) ValueCell!5444)) (size!13287 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26972)

(declare-fun mapKey!18984 () (_ BitVec 32))

(declare-fun mapRest!18984 () (Array (_ BitVec 32) ValueCell!5444))

(assert (=> mapNonEmpty!18984 (= (arr!12935 _values!549) (store mapRest!18984 mapKey!18984 mapValue!18984))))

(declare-fun b!439459 () Bool)

(declare-fun res!259739 () Bool)

(declare-fun e!259051 () Bool)

(assert (=> b!439459 (=> (not res!259739) (not e!259051))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439459 (= res!259739 (validMask!0 mask!1025))))

(declare-fun b!439460 () Bool)

(declare-fun res!259743 () Bool)

(assert (=> b!439460 (=> (not res!259743) (not e!259051))))

(declare-datatypes ((array!26974 0))(
  ( (array!26975 (arr!12936 (Array (_ BitVec 32) (_ BitVec 64))) (size!13288 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26974)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439460 (= res!259743 (or (= (select (arr!12936 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12936 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439461 () Bool)

(declare-fun res!259748 () Bool)

(assert (=> b!439461 (=> (not res!259748) (not e!259051))))

(declare-datatypes ((List!7640 0))(
  ( (Nil!7637) (Cons!7636 (h!8492 (_ BitVec 64)) (t!13388 List!7640)) )
))
(declare-fun arrayNoDuplicates!0 (array!26974 (_ BitVec 32) List!7640) Bool)

(assert (=> b!439461 (= res!259748 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7637))))

(declare-fun b!439462 () Bool)

(declare-fun e!259056 () Bool)

(assert (=> b!439462 (= e!259056 (not true))))

(declare-fun minValue!515 () V!16539)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202311 () array!26972)

(declare-fun zeroValue!515 () V!16539)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202312 () array!26974)

(declare-fun v!412 () V!16539)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7654 0))(
  ( (tuple2!7655 (_1!3838 (_ BitVec 64)) (_2!3838 V!16539)) )
))
(declare-datatypes ((List!7641 0))(
  ( (Nil!7638) (Cons!7637 (h!8493 tuple2!7654) (t!13389 List!7641)) )
))
(declare-datatypes ((ListLongMap!6569 0))(
  ( (ListLongMap!6570 (toList!3300 List!7641)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1533 (array!26974 array!26972 (_ BitVec 32) (_ BitVec 32) V!16539 V!16539 (_ BitVec 32) Int) ListLongMap!6569)

(declare-fun +!1494 (ListLongMap!6569 tuple2!7654) ListLongMap!6569)

(assert (=> b!439462 (= (getCurrentListMapNoExtraKeys!1533 lt!202312 lt!202311 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1494 (getCurrentListMapNoExtraKeys!1533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7655 k0!794 v!412)))))

(declare-datatypes ((Unit!13063 0))(
  ( (Unit!13064) )
))
(declare-fun lt!202314 () Unit!13063)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!654 (array!26974 array!26972 (_ BitVec 32) (_ BitVec 32) V!16539 V!16539 (_ BitVec 32) (_ BitVec 64) V!16539 (_ BitVec 32) Int) Unit!13063)

(assert (=> b!439462 (= lt!202314 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!654 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439463 () Bool)

(declare-fun res!259745 () Bool)

(assert (=> b!439463 (=> (not res!259745) (not e!259051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26974 (_ BitVec 32)) Bool)

(assert (=> b!439463 (= res!259745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439464 () Bool)

(declare-fun e!259052 () Bool)

(assert (=> b!439464 (= e!259052 e!259056)))

(declare-fun res!259749 () Bool)

(assert (=> b!439464 (=> (not res!259749) (not e!259056))))

(assert (=> b!439464 (= res!259749 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202313 () ListLongMap!6569)

(assert (=> b!439464 (= lt!202313 (getCurrentListMapNoExtraKeys!1533 lt!202312 lt!202311 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439464 (= lt!202311 (array!26973 (store (arr!12935 _values!549) i!563 (ValueCellFull!5444 v!412)) (size!13287 _values!549)))))

(declare-fun lt!202310 () ListLongMap!6569)

(assert (=> b!439464 (= lt!202310 (getCurrentListMapNoExtraKeys!1533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439465 () Bool)

(declare-fun tp_is_empty!11575 () Bool)

(assert (=> b!439465 (= e!259053 tp_is_empty!11575)))

(declare-fun b!439466 () Bool)

(declare-fun res!259742 () Bool)

(assert (=> b!439466 (=> (not res!259742) (not e!259051))))

(assert (=> b!439466 (= res!259742 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13288 _keys!709))))))

(declare-fun res!259744 () Bool)

(assert (=> start!40142 (=> (not res!259744) (not e!259051))))

(assert (=> start!40142 (= res!259744 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13288 _keys!709))))))

(assert (=> start!40142 e!259051))

(assert (=> start!40142 tp_is_empty!11575))

(assert (=> start!40142 tp!36798))

(assert (=> start!40142 true))

(declare-fun e!259055 () Bool)

(declare-fun array_inv!9456 (array!26972) Bool)

(assert (=> start!40142 (and (array_inv!9456 _values!549) e!259055)))

(declare-fun array_inv!9457 (array!26974) Bool)

(assert (=> start!40142 (array_inv!9457 _keys!709)))

(declare-fun mapIsEmpty!18984 () Bool)

(assert (=> mapIsEmpty!18984 mapRes!18984))

(declare-fun b!439467 () Bool)

(assert (=> b!439467 (= e!259051 e!259052)))

(declare-fun res!259746 () Bool)

(assert (=> b!439467 (=> (not res!259746) (not e!259052))))

(assert (=> b!439467 (= res!259746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202312 mask!1025))))

(assert (=> b!439467 (= lt!202312 (array!26975 (store (arr!12936 _keys!709) i!563 k0!794) (size!13288 _keys!709)))))

(declare-fun b!439468 () Bool)

(declare-fun res!259740 () Bool)

(assert (=> b!439468 (=> (not res!259740) (not e!259051))))

(declare-fun arrayContainsKey!0 (array!26974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439468 (= res!259740 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439469 () Bool)

(declare-fun res!259738 () Bool)

(assert (=> b!439469 (=> (not res!259738) (not e!259051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439469 (= res!259738 (validKeyInArray!0 k0!794))))

(declare-fun b!439470 () Bool)

(declare-fun e!259057 () Bool)

(assert (=> b!439470 (= e!259057 tp_is_empty!11575)))

(declare-fun b!439471 () Bool)

(declare-fun res!259737 () Bool)

(assert (=> b!439471 (=> (not res!259737) (not e!259052))))

(assert (=> b!439471 (= res!259737 (arrayNoDuplicates!0 lt!202312 #b00000000000000000000000000000000 Nil!7637))))

(declare-fun b!439472 () Bool)

(declare-fun res!259747 () Bool)

(assert (=> b!439472 (=> (not res!259747) (not e!259051))))

(assert (=> b!439472 (= res!259747 (and (= (size!13287 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13288 _keys!709) (size!13287 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439473 () Bool)

(declare-fun res!259741 () Bool)

(assert (=> b!439473 (=> (not res!259741) (not e!259052))))

(assert (=> b!439473 (= res!259741 (bvsle from!863 i!563))))

(declare-fun b!439474 () Bool)

(assert (=> b!439474 (= e!259055 (and e!259057 mapRes!18984))))

(declare-fun condMapEmpty!18984 () Bool)

(declare-fun mapDefault!18984 () ValueCell!5444)

(assert (=> b!439474 (= condMapEmpty!18984 (= (arr!12935 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5444)) mapDefault!18984)))))

(assert (= (and start!40142 res!259744) b!439459))

(assert (= (and b!439459 res!259739) b!439472))

(assert (= (and b!439472 res!259747) b!439463))

(assert (= (and b!439463 res!259745) b!439461))

(assert (= (and b!439461 res!259748) b!439466))

(assert (= (and b!439466 res!259742) b!439469))

(assert (= (and b!439469 res!259738) b!439460))

(assert (= (and b!439460 res!259743) b!439468))

(assert (= (and b!439468 res!259740) b!439467))

(assert (= (and b!439467 res!259746) b!439471))

(assert (= (and b!439471 res!259737) b!439473))

(assert (= (and b!439473 res!259741) b!439464))

(assert (= (and b!439464 res!259749) b!439462))

(assert (= (and b!439474 condMapEmpty!18984) mapIsEmpty!18984))

(assert (= (and b!439474 (not condMapEmpty!18984)) mapNonEmpty!18984))

(get-info :version)

(assert (= (and mapNonEmpty!18984 ((_ is ValueCellFull!5444) mapValue!18984)) b!439465))

(assert (= (and b!439474 ((_ is ValueCellFull!5444) mapDefault!18984)) b!439470))

(assert (= start!40142 b!439474))

(declare-fun m!426965 () Bool)

(assert (=> b!439459 m!426965))

(declare-fun m!426967 () Bool)

(assert (=> b!439460 m!426967))

(declare-fun m!426969 () Bool)

(assert (=> b!439461 m!426969))

(declare-fun m!426971 () Bool)

(assert (=> start!40142 m!426971))

(declare-fun m!426973 () Bool)

(assert (=> start!40142 m!426973))

(declare-fun m!426975 () Bool)

(assert (=> b!439463 m!426975))

(declare-fun m!426977 () Bool)

(assert (=> b!439464 m!426977))

(declare-fun m!426979 () Bool)

(assert (=> b!439464 m!426979))

(declare-fun m!426981 () Bool)

(assert (=> b!439464 m!426981))

(declare-fun m!426983 () Bool)

(assert (=> mapNonEmpty!18984 m!426983))

(declare-fun m!426985 () Bool)

(assert (=> b!439468 m!426985))

(declare-fun m!426987 () Bool)

(assert (=> b!439467 m!426987))

(declare-fun m!426989 () Bool)

(assert (=> b!439467 m!426989))

(declare-fun m!426991 () Bool)

(assert (=> b!439469 m!426991))

(declare-fun m!426993 () Bool)

(assert (=> b!439471 m!426993))

(declare-fun m!426995 () Bool)

(assert (=> b!439462 m!426995))

(declare-fun m!426997 () Bool)

(assert (=> b!439462 m!426997))

(assert (=> b!439462 m!426997))

(declare-fun m!426999 () Bool)

(assert (=> b!439462 m!426999))

(declare-fun m!427001 () Bool)

(assert (=> b!439462 m!427001))

(check-sat (not b_next!10423) (not b!439469) (not b!439462) (not b!439463) (not b!439468) (not b!439464) (not b!439467) (not start!40142) (not b!439461) tp_is_empty!11575 (not b!439459) (not b!439471) b_and!18405 (not mapNonEmpty!18984))
(check-sat b_and!18405 (not b_next!10423))
