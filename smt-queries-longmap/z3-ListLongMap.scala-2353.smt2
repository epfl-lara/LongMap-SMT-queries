; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37566 () Bool)

(assert start!37566)

(declare-fun b_free!8707 () Bool)

(declare-fun b_next!8707 () Bool)

(assert (=> start!37566 (= b_free!8707 (not b_next!8707))))

(declare-fun tp!30837 () Bool)

(declare-fun b_and!15963 () Bool)

(assert (=> start!37566 (= tp!30837 b_and!15963)))

(declare-fun b!384077 () Bool)

(declare-fun res!218853 () Bool)

(declare-fun e!233216 () Bool)

(assert (=> b!384077 (=> (not res!218853) (not e!233216))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13579 0))(
  ( (V!13580 (val!4722 Int)) )
))
(declare-datatypes ((ValueCell!4334 0))(
  ( (ValueCellFull!4334 (v!6920 V!13579)) (EmptyCell!4334) )
))
(declare-datatypes ((array!22604 0))(
  ( (array!22605 (arr!10770 (Array (_ BitVec 32) ValueCell!4334)) (size!11122 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22604)

(declare-datatypes ((array!22606 0))(
  ( (array!22607 (arr!10771 (Array (_ BitVec 32) (_ BitVec 64))) (size!11123 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22606)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!384077 (= res!218853 (and (= (size!11122 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11123 _keys!658) (size!11122 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384078 () Bool)

(declare-fun res!218856 () Bool)

(assert (=> b!384078 (=> (not res!218856) (not e!233216))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384078 (= res!218856 (validKeyInArray!0 k0!778))))

(declare-fun b!384079 () Bool)

(declare-fun e!233220 () Bool)

(assert (=> b!384079 (= e!233216 e!233220)))

(declare-fun res!218855 () Bool)

(assert (=> b!384079 (=> (not res!218855) (not e!233220))))

(declare-fun lt!180679 () array!22606)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22606 (_ BitVec 32)) Bool)

(assert (=> b!384079 (= res!218855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180679 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384079 (= lt!180679 (array!22607 (store (arr!10771 _keys!658) i!548 k0!778) (size!11123 _keys!658)))))

(declare-fun b!384080 () Bool)

(declare-fun res!218854 () Bool)

(assert (=> b!384080 (=> (not res!218854) (not e!233216))))

(declare-fun arrayContainsKey!0 (array!22606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384080 (= res!218854 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384081 () Bool)

(declare-fun res!218851 () Bool)

(assert (=> b!384081 (=> (not res!218851) (not e!233216))))

(assert (=> b!384081 (= res!218851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384082 () Bool)

(declare-fun e!233219 () Bool)

(declare-fun tp_is_empty!9355 () Bool)

(assert (=> b!384082 (= e!233219 tp_is_empty!9355)))

(declare-fun b!384083 () Bool)

(declare-fun res!218858 () Bool)

(assert (=> b!384083 (=> (not res!218858) (not e!233220))))

(declare-datatypes ((List!6068 0))(
  ( (Nil!6065) (Cons!6064 (h!6920 (_ BitVec 64)) (t!11210 List!6068)) )
))
(declare-fun arrayNoDuplicates!0 (array!22606 (_ BitVec 32) List!6068) Bool)

(assert (=> b!384083 (= res!218858 (arrayNoDuplicates!0 lt!180679 #b00000000000000000000000000000000 Nil!6065))))

(declare-fun b!384084 () Bool)

(declare-fun res!218849 () Bool)

(assert (=> b!384084 (=> (not res!218849) (not e!233216))))

(assert (=> b!384084 (= res!218849 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6065))))

(declare-fun b!384085 () Bool)

(declare-fun res!218847 () Bool)

(assert (=> b!384085 (=> (not res!218847) (not e!233216))))

(assert (=> b!384085 (= res!218847 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11123 _keys!658))))))

(declare-fun b!384086 () Bool)

(declare-fun e!233213 () Bool)

(assert (=> b!384086 (= e!233220 (not e!233213))))

(declare-fun res!218850 () Bool)

(assert (=> b!384086 (=> res!218850 e!233213)))

(declare-fun lt!180673 () Bool)

(assert (=> b!384086 (= res!218850 (or (and (not lt!180673) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180673) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180673)))))

(assert (=> b!384086 (= lt!180673 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13579)

(declare-datatypes ((tuple2!6232 0))(
  ( (tuple2!6233 (_1!3127 (_ BitVec 64)) (_2!3127 V!13579)) )
))
(declare-datatypes ((List!6069 0))(
  ( (Nil!6066) (Cons!6065 (h!6921 tuple2!6232) (t!11211 List!6069)) )
))
(declare-datatypes ((ListLongMap!5147 0))(
  ( (ListLongMap!5148 (toList!2589 List!6069)) )
))
(declare-fun lt!180678 () ListLongMap!5147)

(declare-fun minValue!472 () V!13579)

(declare-fun getCurrentListMap!2020 (array!22606 array!22604 (_ BitVec 32) (_ BitVec 32) V!13579 V!13579 (_ BitVec 32) Int) ListLongMap!5147)

(assert (=> b!384086 (= lt!180678 (getCurrentListMap!2020 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180674 () ListLongMap!5147)

(declare-fun lt!180672 () array!22604)

(assert (=> b!384086 (= lt!180674 (getCurrentListMap!2020 lt!180679 lt!180672 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180671 () ListLongMap!5147)

(declare-fun lt!180677 () ListLongMap!5147)

(assert (=> b!384086 (and (= lt!180671 lt!180677) (= lt!180677 lt!180671))))

(declare-fun lt!180675 () ListLongMap!5147)

(declare-fun lt!180670 () tuple2!6232)

(declare-fun +!981 (ListLongMap!5147 tuple2!6232) ListLongMap!5147)

(assert (=> b!384086 (= lt!180677 (+!981 lt!180675 lt!180670))))

(declare-fun v!373 () V!13579)

(assert (=> b!384086 (= lt!180670 (tuple2!6233 k0!778 v!373))))

(declare-datatypes ((Unit!11835 0))(
  ( (Unit!11836) )
))
(declare-fun lt!180676 () Unit!11835)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!207 (array!22606 array!22604 (_ BitVec 32) (_ BitVec 32) V!13579 V!13579 (_ BitVec 32) (_ BitVec 64) V!13579 (_ BitVec 32) Int) Unit!11835)

(assert (=> b!384086 (= lt!180676 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!207 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!867 (array!22606 array!22604 (_ BitVec 32) (_ BitVec 32) V!13579 V!13579 (_ BitVec 32) Int) ListLongMap!5147)

(assert (=> b!384086 (= lt!180671 (getCurrentListMapNoExtraKeys!867 lt!180679 lt!180672 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384086 (= lt!180672 (array!22605 (store (arr!10770 _values!506) i!548 (ValueCellFull!4334 v!373)) (size!11122 _values!506)))))

(assert (=> b!384086 (= lt!180675 (getCurrentListMapNoExtraKeys!867 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15597 () Bool)

(declare-fun mapRes!15597 () Bool)

(assert (=> mapIsEmpty!15597 mapRes!15597))

(declare-fun b!384087 () Bool)

(declare-fun e!233214 () Bool)

(assert (=> b!384087 (= e!233214 (bvsle #b00000000000000000000000000000000 (size!11123 _keys!658)))))

(declare-fun b!384088 () Bool)

(declare-fun e!233217 () Bool)

(assert (=> b!384088 (= e!233217 tp_is_empty!9355)))

(declare-fun b!384089 () Bool)

(declare-fun e!233218 () Bool)

(assert (=> b!384089 (= e!233218 (and e!233217 mapRes!15597))))

(declare-fun condMapEmpty!15597 () Bool)

(declare-fun mapDefault!15597 () ValueCell!4334)

(assert (=> b!384089 (= condMapEmpty!15597 (= (arr!10770 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4334)) mapDefault!15597)))))

(declare-fun b!384090 () Bool)

(assert (=> b!384090 (= e!233213 e!233214)))

(declare-fun res!218852 () Bool)

(assert (=> b!384090 (=> res!218852 e!233214)))

(assert (=> b!384090 (= res!218852 (not (= (+!981 lt!180678 lt!180670) lt!180674)))))

(assert (=> b!384090 (= lt!180674 lt!180671)))

(declare-fun b!384091 () Bool)

(declare-fun res!218848 () Bool)

(assert (=> b!384091 (=> (not res!218848) (not e!233216))))

(assert (=> b!384091 (= res!218848 (or (= (select (arr!10771 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10771 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15597 () Bool)

(declare-fun tp!30836 () Bool)

(assert (=> mapNonEmpty!15597 (= mapRes!15597 (and tp!30836 e!233219))))

(declare-fun mapRest!15597 () (Array (_ BitVec 32) ValueCell!4334))

(declare-fun mapValue!15597 () ValueCell!4334)

(declare-fun mapKey!15597 () (_ BitVec 32))

(assert (=> mapNonEmpty!15597 (= (arr!10770 _values!506) (store mapRest!15597 mapKey!15597 mapValue!15597))))

(declare-fun res!218857 () Bool)

(assert (=> start!37566 (=> (not res!218857) (not e!233216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37566 (= res!218857 (validMask!0 mask!970))))

(assert (=> start!37566 e!233216))

(declare-fun array_inv!7970 (array!22604) Bool)

(assert (=> start!37566 (and (array_inv!7970 _values!506) e!233218)))

(assert (=> start!37566 tp!30837))

(assert (=> start!37566 true))

(assert (=> start!37566 tp_is_empty!9355))

(declare-fun array_inv!7971 (array!22606) Bool)

(assert (=> start!37566 (array_inv!7971 _keys!658)))

(assert (= (and start!37566 res!218857) b!384077))

(assert (= (and b!384077 res!218853) b!384081))

(assert (= (and b!384081 res!218851) b!384084))

(assert (= (and b!384084 res!218849) b!384085))

(assert (= (and b!384085 res!218847) b!384078))

(assert (= (and b!384078 res!218856) b!384091))

(assert (= (and b!384091 res!218848) b!384080))

(assert (= (and b!384080 res!218854) b!384079))

(assert (= (and b!384079 res!218855) b!384083))

(assert (= (and b!384083 res!218858) b!384086))

(assert (= (and b!384086 (not res!218850)) b!384090))

(assert (= (and b!384090 (not res!218852)) b!384087))

(assert (= (and b!384089 condMapEmpty!15597) mapIsEmpty!15597))

(assert (= (and b!384089 (not condMapEmpty!15597)) mapNonEmpty!15597))

(get-info :version)

(assert (= (and mapNonEmpty!15597 ((_ is ValueCellFull!4334) mapValue!15597)) b!384082))

(assert (= (and b!384089 ((_ is ValueCellFull!4334) mapDefault!15597)) b!384088))

(assert (= start!37566 b!384089))

(declare-fun m!381065 () Bool)

(assert (=> b!384083 m!381065))

(declare-fun m!381067 () Bool)

(assert (=> b!384078 m!381067))

(declare-fun m!381069 () Bool)

(assert (=> b!384091 m!381069))

(declare-fun m!381071 () Bool)

(assert (=> b!384084 m!381071))

(declare-fun m!381073 () Bool)

(assert (=> b!384080 m!381073))

(declare-fun m!381075 () Bool)

(assert (=> b!384090 m!381075))

(declare-fun m!381077 () Bool)

(assert (=> b!384081 m!381077))

(declare-fun m!381079 () Bool)

(assert (=> b!384086 m!381079))

(declare-fun m!381081 () Bool)

(assert (=> b!384086 m!381081))

(declare-fun m!381083 () Bool)

(assert (=> b!384086 m!381083))

(declare-fun m!381085 () Bool)

(assert (=> b!384086 m!381085))

(declare-fun m!381087 () Bool)

(assert (=> b!384086 m!381087))

(declare-fun m!381089 () Bool)

(assert (=> b!384086 m!381089))

(declare-fun m!381091 () Bool)

(assert (=> b!384086 m!381091))

(declare-fun m!381093 () Bool)

(assert (=> start!37566 m!381093))

(declare-fun m!381095 () Bool)

(assert (=> start!37566 m!381095))

(declare-fun m!381097 () Bool)

(assert (=> start!37566 m!381097))

(declare-fun m!381099 () Bool)

(assert (=> b!384079 m!381099))

(declare-fun m!381101 () Bool)

(assert (=> b!384079 m!381101))

(declare-fun m!381103 () Bool)

(assert (=> mapNonEmpty!15597 m!381103))

(check-sat (not b!384086) (not b!384080) b_and!15963 (not b!384083) (not b_next!8707) (not b!384079) tp_is_empty!9355 (not b!384090) (not b!384084) (not b!384081) (not start!37566) (not mapNonEmpty!15597) (not b!384078))
(check-sat b_and!15963 (not b_next!8707))
