; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40148 () Bool)

(assert start!40148)

(declare-fun b_free!10429 () Bool)

(declare-fun b_next!10429 () Bool)

(assert (=> start!40148 (= b_free!10429 (not b_next!10429))))

(declare-fun tp!36815 () Bool)

(declare-fun b_and!18411 () Bool)

(assert (=> start!40148 (= tp!36815 b_and!18411)))

(declare-fun b!439603 () Bool)

(declare-fun res!259862 () Bool)

(declare-fun e!259117 () Bool)

(assert (=> b!439603 (=> (not res!259862) (not e!259117))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439603 (= res!259862 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18993 () Bool)

(declare-fun mapRes!18993 () Bool)

(declare-fun tp!36816 () Bool)

(declare-fun e!259116 () Bool)

(assert (=> mapNonEmpty!18993 (= mapRes!18993 (and tp!36816 e!259116))))

(declare-fun mapKey!18993 () (_ BitVec 32))

(declare-datatypes ((V!16547 0))(
  ( (V!16548 (val!5835 Int)) )
))
(declare-datatypes ((ValueCell!5447 0))(
  ( (ValueCellFull!5447 (v!8083 V!16547)) (EmptyCell!5447) )
))
(declare-datatypes ((array!26984 0))(
  ( (array!26985 (arr!12941 (Array (_ BitVec 32) ValueCell!5447)) (size!13293 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26984)

(declare-fun mapRest!18993 () (Array (_ BitVec 32) ValueCell!5447))

(declare-fun mapValue!18993 () ValueCell!5447)

(assert (=> mapNonEmpty!18993 (= (arr!12941 _values!549) (store mapRest!18993 mapKey!18993 mapValue!18993))))

(declare-fun b!439604 () Bool)

(declare-fun res!259866 () Bool)

(assert (=> b!439604 (=> (not res!259866) (not e!259117))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439604 (= res!259866 (validMask!0 mask!1025))))

(declare-fun b!439605 () Bool)

(declare-fun res!259858 () Bool)

(declare-fun e!259119 () Bool)

(assert (=> b!439605 (=> (not res!259858) (not e!259119))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439605 (= res!259858 (bvsle from!863 i!563))))

(declare-fun b!439606 () Bool)

(declare-fun res!259857 () Bool)

(assert (=> b!439606 (=> (not res!259857) (not e!259117))))

(declare-datatypes ((array!26986 0))(
  ( (array!26987 (arr!12942 (Array (_ BitVec 32) (_ BitVec 64))) (size!13294 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26986)

(declare-datatypes ((List!7643 0))(
  ( (Nil!7640) (Cons!7639 (h!8495 (_ BitVec 64)) (t!13391 List!7643)) )
))
(declare-fun arrayNoDuplicates!0 (array!26986 (_ BitVec 32) List!7643) Bool)

(assert (=> b!439606 (= res!259857 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7640))))

(declare-fun b!439607 () Bool)

(declare-fun res!259863 () Bool)

(assert (=> b!439607 (=> (not res!259863) (not e!259117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26986 (_ BitVec 32)) Bool)

(assert (=> b!439607 (= res!259863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439608 () Bool)

(declare-fun res!259861 () Bool)

(assert (=> b!439608 (=> (not res!259861) (not e!259119))))

(declare-fun lt!202355 () array!26986)

(assert (=> b!439608 (= res!259861 (arrayNoDuplicates!0 lt!202355 #b00000000000000000000000000000000 Nil!7640))))

(declare-fun b!439609 () Bool)

(declare-fun res!259856 () Bool)

(assert (=> b!439609 (=> (not res!259856) (not e!259117))))

(assert (=> b!439609 (= res!259856 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13294 _keys!709))))))

(declare-fun b!439610 () Bool)

(assert (=> b!439610 (= e!259117 e!259119)))

(declare-fun res!259855 () Bool)

(assert (=> b!439610 (=> (not res!259855) (not e!259119))))

(assert (=> b!439610 (= res!259855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202355 mask!1025))))

(assert (=> b!439610 (= lt!202355 (array!26987 (store (arr!12942 _keys!709) i!563 k0!794) (size!13294 _keys!709)))))

(declare-fun mapIsEmpty!18993 () Bool)

(assert (=> mapIsEmpty!18993 mapRes!18993))

(declare-fun res!259859 () Bool)

(assert (=> start!40148 (=> (not res!259859) (not e!259117))))

(assert (=> start!40148 (= res!259859 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13294 _keys!709))))))

(assert (=> start!40148 e!259117))

(declare-fun tp_is_empty!11581 () Bool)

(assert (=> start!40148 tp_is_empty!11581))

(assert (=> start!40148 tp!36815))

(assert (=> start!40148 true))

(declare-fun e!259115 () Bool)

(declare-fun array_inv!9460 (array!26984) Bool)

(assert (=> start!40148 (and (array_inv!9460 _values!549) e!259115)))

(declare-fun array_inv!9461 (array!26986) Bool)

(assert (=> start!40148 (array_inv!9461 _keys!709)))

(declare-fun b!439611 () Bool)

(declare-fun e!259118 () Bool)

(assert (=> b!439611 (= e!259115 (and e!259118 mapRes!18993))))

(declare-fun condMapEmpty!18993 () Bool)

(declare-fun mapDefault!18993 () ValueCell!5447)

(assert (=> b!439611 (= condMapEmpty!18993 (= (arr!12941 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5447)) mapDefault!18993)))))

(declare-fun b!439612 () Bool)

(declare-fun res!259865 () Bool)

(assert (=> b!439612 (=> (not res!259865) (not e!259117))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!439612 (= res!259865 (and (= (size!13293 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13294 _keys!709) (size!13293 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439613 () Bool)

(assert (=> b!439613 (= e!259116 tp_is_empty!11581)))

(declare-fun b!439614 () Bool)

(declare-fun res!259860 () Bool)

(assert (=> b!439614 (=> (not res!259860) (not e!259117))))

(declare-fun arrayContainsKey!0 (array!26986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439614 (= res!259860 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439615 () Bool)

(declare-fun e!259120 () Bool)

(assert (=> b!439615 (= e!259119 e!259120)))

(declare-fun res!259864 () Bool)

(assert (=> b!439615 (=> (not res!259864) (not e!259120))))

(assert (=> b!439615 (= res!259864 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16547)

(declare-fun minValue!515 () V!16547)

(declare-datatypes ((tuple2!7656 0))(
  ( (tuple2!7657 (_1!3839 (_ BitVec 64)) (_2!3839 V!16547)) )
))
(declare-datatypes ((List!7644 0))(
  ( (Nil!7641) (Cons!7640 (h!8496 tuple2!7656) (t!13392 List!7644)) )
))
(declare-datatypes ((ListLongMap!6571 0))(
  ( (ListLongMap!6572 (toList!3301 List!7644)) )
))
(declare-fun lt!202359 () ListLongMap!6571)

(declare-fun lt!202358 () array!26984)

(declare-fun getCurrentListMapNoExtraKeys!1534 (array!26986 array!26984 (_ BitVec 32) (_ BitVec 32) V!16547 V!16547 (_ BitVec 32) Int) ListLongMap!6571)

(assert (=> b!439615 (= lt!202359 (getCurrentListMapNoExtraKeys!1534 lt!202355 lt!202358 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16547)

(assert (=> b!439615 (= lt!202358 (array!26985 (store (arr!12941 _values!549) i!563 (ValueCellFull!5447 v!412)) (size!13293 _values!549)))))

(declare-fun lt!202357 () ListLongMap!6571)

(assert (=> b!439615 (= lt!202357 (getCurrentListMapNoExtraKeys!1534 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439616 () Bool)

(assert (=> b!439616 (= e!259118 tp_is_empty!11581)))

(declare-fun b!439617 () Bool)

(assert (=> b!439617 (= e!259120 (not true))))

(declare-fun +!1495 (ListLongMap!6571 tuple2!7656) ListLongMap!6571)

(assert (=> b!439617 (= (getCurrentListMapNoExtraKeys!1534 lt!202355 lt!202358 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1495 (getCurrentListMapNoExtraKeys!1534 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7657 k0!794 v!412)))))

(declare-datatypes ((Unit!13065 0))(
  ( (Unit!13066) )
))
(declare-fun lt!202356 () Unit!13065)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!655 (array!26986 array!26984 (_ BitVec 32) (_ BitVec 32) V!16547 V!16547 (_ BitVec 32) (_ BitVec 64) V!16547 (_ BitVec 32) Int) Unit!13065)

(assert (=> b!439617 (= lt!202356 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439618 () Bool)

(declare-fun res!259854 () Bool)

(assert (=> b!439618 (=> (not res!259854) (not e!259117))))

(assert (=> b!439618 (= res!259854 (or (= (select (arr!12942 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12942 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40148 res!259859) b!439604))

(assert (= (and b!439604 res!259866) b!439612))

(assert (= (and b!439612 res!259865) b!439607))

(assert (= (and b!439607 res!259863) b!439606))

(assert (= (and b!439606 res!259857) b!439609))

(assert (= (and b!439609 res!259856) b!439603))

(assert (= (and b!439603 res!259862) b!439618))

(assert (= (and b!439618 res!259854) b!439614))

(assert (= (and b!439614 res!259860) b!439610))

(assert (= (and b!439610 res!259855) b!439608))

(assert (= (and b!439608 res!259861) b!439605))

(assert (= (and b!439605 res!259858) b!439615))

(assert (= (and b!439615 res!259864) b!439617))

(assert (= (and b!439611 condMapEmpty!18993) mapIsEmpty!18993))

(assert (= (and b!439611 (not condMapEmpty!18993)) mapNonEmpty!18993))

(get-info :version)

(assert (= (and mapNonEmpty!18993 ((_ is ValueCellFull!5447) mapValue!18993)) b!439613))

(assert (= (and b!439611 ((_ is ValueCellFull!5447) mapDefault!18993)) b!439616))

(assert (= start!40148 b!439611))

(declare-fun m!427079 () Bool)

(assert (=> b!439614 m!427079))

(declare-fun m!427081 () Bool)

(assert (=> start!40148 m!427081))

(declare-fun m!427083 () Bool)

(assert (=> start!40148 m!427083))

(declare-fun m!427085 () Bool)

(assert (=> b!439604 m!427085))

(declare-fun m!427087 () Bool)

(assert (=> b!439606 m!427087))

(declare-fun m!427089 () Bool)

(assert (=> b!439618 m!427089))

(declare-fun m!427091 () Bool)

(assert (=> b!439617 m!427091))

(declare-fun m!427093 () Bool)

(assert (=> b!439617 m!427093))

(assert (=> b!439617 m!427093))

(declare-fun m!427095 () Bool)

(assert (=> b!439617 m!427095))

(declare-fun m!427097 () Bool)

(assert (=> b!439617 m!427097))

(declare-fun m!427099 () Bool)

(assert (=> b!439610 m!427099))

(declare-fun m!427101 () Bool)

(assert (=> b!439610 m!427101))

(declare-fun m!427103 () Bool)

(assert (=> b!439608 m!427103))

(declare-fun m!427105 () Bool)

(assert (=> b!439615 m!427105))

(declare-fun m!427107 () Bool)

(assert (=> b!439615 m!427107))

(declare-fun m!427109 () Bool)

(assert (=> b!439615 m!427109))

(declare-fun m!427111 () Bool)

(assert (=> mapNonEmpty!18993 m!427111))

(declare-fun m!427113 () Bool)

(assert (=> b!439607 m!427113))

(declare-fun m!427115 () Bool)

(assert (=> b!439603 m!427115))

(check-sat (not start!40148) (not b!439610) b_and!18411 (not b!439617) tp_is_empty!11581 (not b!439607) (not b_next!10429) (not mapNonEmpty!18993) (not b!439604) (not b!439614) (not b!439606) (not b!439608) (not b!439603) (not b!439615))
(check-sat b_and!18411 (not b_next!10429))
