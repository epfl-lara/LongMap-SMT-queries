; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38704 () Bool)

(assert start!38704)

(declare-fun b_free!9241 () Bool)

(declare-fun b_next!9241 () Bool)

(assert (=> start!38704 (= b_free!9241 (not b_next!9241))))

(declare-fun tp!32847 () Bool)

(declare-fun b_and!16627 () Bool)

(assert (=> start!38704 (= tp!32847 b_and!16627)))

(declare-fun b!402604 () Bool)

(declare-fun e!242537 () Bool)

(declare-fun e!242538 () Bool)

(assert (=> b!402604 (= e!242537 e!242538)))

(declare-fun res!231916 () Bool)

(assert (=> b!402604 (=> (not res!231916) (not e!242538))))

(declare-datatypes ((array!24151 0))(
  ( (array!24152 (arr!11525 (Array (_ BitVec 32) (_ BitVec 64))) (size!11877 (_ BitVec 32))) )
))
(declare-fun lt!187949 () array!24151)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24151 (_ BitVec 32)) Bool)

(assert (=> b!402604 (= res!231916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187949 mask!1025))))

(declare-fun _keys!709 () array!24151)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402604 (= lt!187949 (array!24152 (store (arr!11525 _keys!709) i!563 k!794) (size!11877 _keys!709)))))

(declare-fun b!402606 () Bool)

(declare-fun res!231919 () Bool)

(assert (=> b!402606 (=> (not res!231919) (not e!242537))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14603 0))(
  ( (V!14604 (val!5106 Int)) )
))
(declare-datatypes ((ValueCell!4718 0))(
  ( (ValueCellFull!4718 (v!7353 V!14603)) (EmptyCell!4718) )
))
(declare-datatypes ((array!24153 0))(
  ( (array!24154 (arr!11526 (Array (_ BitVec 32) ValueCell!4718)) (size!11878 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24153)

(assert (=> b!402606 (= res!231919 (and (= (size!11878 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11877 _keys!709) (size!11878 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14603)

(declare-datatypes ((tuple2!6782 0))(
  ( (tuple2!6783 (_1!3402 (_ BitVec 64)) (_2!3402 V!14603)) )
))
(declare-datatypes ((List!6704 0))(
  ( (Nil!6701) (Cons!6700 (h!7556 tuple2!6782) (t!11878 List!6704)) )
))
(declare-datatypes ((ListLongMap!5695 0))(
  ( (ListLongMap!5696 (toList!2863 List!6704)) )
))
(declare-fun call!28387 () ListLongMap!5695)

(declare-fun c!54818 () Bool)

(declare-fun v!412 () V!14603)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!14603)

(declare-fun bm!28384 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1073 (array!24151 array!24153 (_ BitVec 32) (_ BitVec 32) V!14603 V!14603 (_ BitVec 32) Int) ListLongMap!5695)

(assert (=> bm!28384 (= call!28387 (getCurrentListMapNoExtraKeys!1073 (ite c!54818 lt!187949 _keys!709) (ite c!54818 (array!24154 (store (arr!11526 _values!549) i!563 (ValueCellFull!4718 v!412)) (size!11878 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28385 () Bool)

(declare-fun call!28388 () ListLongMap!5695)

(assert (=> bm!28385 (= call!28388 (getCurrentListMapNoExtraKeys!1073 (ite c!54818 _keys!709 lt!187949) (ite c!54818 _values!549 (array!24154 (store (arr!11526 _values!549) i!563 (ValueCellFull!4718 v!412)) (size!11878 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402607 () Bool)

(declare-fun res!231911 () Bool)

(assert (=> b!402607 (=> (not res!231911) (not e!242537))))

(assert (=> b!402607 (= res!231911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402608 () Bool)

(assert (=> b!402608 (= e!242538 (not true))))

(declare-fun e!242535 () Bool)

(assert (=> b!402608 e!242535))

(assert (=> b!402608 (= c!54818 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12190 0))(
  ( (Unit!12191) )
))
(declare-fun lt!187948 () Unit!12190)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!353 (array!24151 array!24153 (_ BitVec 32) (_ BitVec 32) V!14603 V!14603 (_ BitVec 32) (_ BitVec 64) V!14603 (_ BitVec 32) Int) Unit!12190)

(assert (=> b!402608 (= lt!187948 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!353 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402609 () Bool)

(declare-fun res!231917 () Bool)

(assert (=> b!402609 (=> (not res!231917) (not e!242537))))

(assert (=> b!402609 (= res!231917 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11877 _keys!709))))))

(declare-fun b!402610 () Bool)

(declare-fun res!231913 () Bool)

(assert (=> b!402610 (=> (not res!231913) (not e!242537))))

(assert (=> b!402610 (= res!231913 (or (= (select (arr!11525 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11525 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!231915 () Bool)

(assert (=> start!38704 (=> (not res!231915) (not e!242537))))

(assert (=> start!38704 (= res!231915 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11877 _keys!709))))))

(assert (=> start!38704 e!242537))

(declare-fun tp_is_empty!10123 () Bool)

(assert (=> start!38704 tp_is_empty!10123))

(assert (=> start!38704 tp!32847))

(assert (=> start!38704 true))

(declare-fun e!242536 () Bool)

(declare-fun array_inv!8432 (array!24153) Bool)

(assert (=> start!38704 (and (array_inv!8432 _values!549) e!242536)))

(declare-fun array_inv!8433 (array!24151) Bool)

(assert (=> start!38704 (array_inv!8433 _keys!709)))

(declare-fun b!402605 () Bool)

(declare-fun e!242532 () Bool)

(assert (=> b!402605 (= e!242532 tp_is_empty!10123)))

(declare-fun b!402611 () Bool)

(declare-fun res!231918 () Bool)

(assert (=> b!402611 (=> (not res!231918) (not e!242537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402611 (= res!231918 (validMask!0 mask!1025))))

(declare-fun b!402612 () Bool)

(declare-fun res!231914 () Bool)

(assert (=> b!402612 (=> (not res!231914) (not e!242537))))

(declare-fun arrayContainsKey!0 (array!24151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402612 (= res!231914 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!402613 () Bool)

(assert (=> b!402613 (= e!242535 (= call!28388 call!28387))))

(declare-fun b!402614 () Bool)

(declare-fun res!231910 () Bool)

(assert (=> b!402614 (=> (not res!231910) (not e!242537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402614 (= res!231910 (validKeyInArray!0 k!794))))

(declare-fun b!402615 () Bool)

(declare-fun res!231912 () Bool)

(assert (=> b!402615 (=> (not res!231912) (not e!242538))))

(assert (=> b!402615 (= res!231912 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11877 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16806 () Bool)

(declare-fun mapRes!16806 () Bool)

(declare-fun tp!32846 () Bool)

(assert (=> mapNonEmpty!16806 (= mapRes!16806 (and tp!32846 e!242532))))

(declare-fun mapRest!16806 () (Array (_ BitVec 32) ValueCell!4718))

(declare-fun mapKey!16806 () (_ BitVec 32))

(declare-fun mapValue!16806 () ValueCell!4718)

(assert (=> mapNonEmpty!16806 (= (arr!11526 _values!549) (store mapRest!16806 mapKey!16806 mapValue!16806))))

(declare-fun b!402616 () Bool)

(declare-fun res!231921 () Bool)

(assert (=> b!402616 (=> (not res!231921) (not e!242537))))

(declare-datatypes ((List!6705 0))(
  ( (Nil!6702) (Cons!6701 (h!7557 (_ BitVec 64)) (t!11879 List!6705)) )
))
(declare-fun arrayNoDuplicates!0 (array!24151 (_ BitVec 32) List!6705) Bool)

(assert (=> b!402616 (= res!231921 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6702))))

(declare-fun b!402617 () Bool)

(declare-fun e!242534 () Bool)

(assert (=> b!402617 (= e!242536 (and e!242534 mapRes!16806))))

(declare-fun condMapEmpty!16806 () Bool)

(declare-fun mapDefault!16806 () ValueCell!4718)

