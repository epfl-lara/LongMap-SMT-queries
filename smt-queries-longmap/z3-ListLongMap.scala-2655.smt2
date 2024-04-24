; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39734 () Bool)

(assert start!39734)

(declare-fun b_free!10015 () Bool)

(declare-fun b_next!10015 () Bool)

(assert (=> start!39734 (= b_free!10015 (not b_next!10015))))

(declare-fun tp!35574 () Bool)

(declare-fun b_and!17703 () Bool)

(assert (=> start!39734 (= tp!35574 b_and!17703)))

(declare-fun b!427782 () Bool)

(declare-fun e!253592 () Bool)

(declare-fun e!253593 () Bool)

(assert (=> b!427782 (= e!253592 e!253593)))

(declare-fun res!251031 () Bool)

(assert (=> b!427782 (=> (not res!251031) (not e!253593))))

(declare-datatypes ((array!26180 0))(
  ( (array!26181 (arr!12539 (Array (_ BitVec 32) (_ BitVec 64))) (size!12891 (_ BitVec 32))) )
))
(declare-fun lt!195489 () array!26180)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26180 (_ BitVec 32)) Bool)

(assert (=> b!427782 (= res!251031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195489 mask!1025))))

(declare-fun _keys!709 () array!26180)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427782 (= lt!195489 (array!26181 (store (arr!12539 _keys!709) i!563 k0!794) (size!12891 _keys!709)))))

(declare-fun mapIsEmpty!18372 () Bool)

(declare-fun mapRes!18372 () Bool)

(assert (=> mapIsEmpty!18372 mapRes!18372))

(declare-fun b!427783 () Bool)

(declare-fun res!251027 () Bool)

(assert (=> b!427783 (=> (not res!251027) (not e!253593))))

(declare-datatypes ((List!7305 0))(
  ( (Nil!7302) (Cons!7301 (h!8157 (_ BitVec 64)) (t!12761 List!7305)) )
))
(declare-fun arrayNoDuplicates!0 (array!26180 (_ BitVec 32) List!7305) Bool)

(assert (=> b!427783 (= res!251027 (arrayNoDuplicates!0 lt!195489 #b00000000000000000000000000000000 Nil!7302))))

(declare-fun b!427784 () Bool)

(declare-fun res!251021 () Bool)

(assert (=> b!427784 (=> (not res!251021) (not e!253592))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15995 0))(
  ( (V!15996 (val!5628 Int)) )
))
(declare-datatypes ((ValueCell!5240 0))(
  ( (ValueCellFull!5240 (v!7876 V!15995)) (EmptyCell!5240) )
))
(declare-datatypes ((array!26182 0))(
  ( (array!26183 (arr!12540 (Array (_ BitVec 32) ValueCell!5240)) (size!12892 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26182)

(assert (=> b!427784 (= res!251021 (and (= (size!12892 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12891 _keys!709) (size!12892 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427785 () Bool)

(declare-fun e!253596 () Bool)

(assert (=> b!427785 (= e!253593 e!253596)))

(declare-fun res!251022 () Bool)

(assert (=> b!427785 (=> (not res!251022) (not e!253596))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427785 (= res!251022 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15995)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7302 0))(
  ( (tuple2!7303 (_1!3662 (_ BitVec 64)) (_2!3662 V!15995)) )
))
(declare-datatypes ((List!7306 0))(
  ( (Nil!7303) (Cons!7302 (h!8158 tuple2!7302) (t!12762 List!7306)) )
))
(declare-datatypes ((ListLongMap!6217 0))(
  ( (ListLongMap!6218 (toList!3124 List!7306)) )
))
(declare-fun lt!195492 () ListLongMap!6217)

(declare-fun zeroValue!515 () V!15995)

(declare-fun lt!195485 () array!26182)

(declare-fun getCurrentListMapNoExtraKeys!1370 (array!26180 array!26182 (_ BitVec 32) (_ BitVec 32) V!15995 V!15995 (_ BitVec 32) Int) ListLongMap!6217)

(assert (=> b!427785 (= lt!195492 (getCurrentListMapNoExtraKeys!1370 lt!195489 lt!195485 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15995)

(assert (=> b!427785 (= lt!195485 (array!26183 (store (arr!12540 _values!549) i!563 (ValueCellFull!5240 v!412)) (size!12892 _values!549)))))

(declare-fun lt!195487 () ListLongMap!6217)

(assert (=> b!427785 (= lt!195487 (getCurrentListMapNoExtraKeys!1370 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427786 () Bool)

(declare-fun e!253591 () Bool)

(assert (=> b!427786 (= e!253591 true)))

(declare-fun lt!195486 () ListLongMap!6217)

(declare-fun +!1337 (ListLongMap!6217 tuple2!7302) ListLongMap!6217)

(declare-fun get!6213 (ValueCell!5240 V!15995) V!15995)

(declare-fun dynLambda!754 (Int (_ BitVec 64)) V!15995)

(assert (=> b!427786 (= lt!195492 (+!1337 lt!195486 (tuple2!7303 (select (arr!12539 _keys!709) from!863) (get!6213 (select (arr!12540 _values!549) from!863) (dynLambda!754 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427787 () Bool)

(declare-fun res!251026 () Bool)

(assert (=> b!427787 (=> (not res!251026) (not e!253592))))

(assert (=> b!427787 (= res!251026 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7302))))

(declare-fun b!427788 () Bool)

(declare-fun res!251020 () Bool)

(assert (=> b!427788 (=> (not res!251020) (not e!253592))))

(assert (=> b!427788 (= res!251020 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12891 _keys!709))))))

(declare-fun b!427789 () Bool)

(declare-fun e!253594 () Bool)

(declare-fun e!253590 () Bool)

(assert (=> b!427789 (= e!253594 (and e!253590 mapRes!18372))))

(declare-fun condMapEmpty!18372 () Bool)

(declare-fun mapDefault!18372 () ValueCell!5240)

(assert (=> b!427789 (= condMapEmpty!18372 (= (arr!12540 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5240)) mapDefault!18372)))))

(declare-fun b!427790 () Bool)

(declare-fun res!251018 () Bool)

(assert (=> b!427790 (=> (not res!251018) (not e!253592))))

(assert (=> b!427790 (= res!251018 (or (= (select (arr!12539 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12539 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!251024 () Bool)

(assert (=> start!39734 (=> (not res!251024) (not e!253592))))

(assert (=> start!39734 (= res!251024 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12891 _keys!709))))))

(assert (=> start!39734 e!253592))

(declare-fun tp_is_empty!11167 () Bool)

(assert (=> start!39734 tp_is_empty!11167))

(assert (=> start!39734 tp!35574))

(assert (=> start!39734 true))

(declare-fun array_inv!9204 (array!26182) Bool)

(assert (=> start!39734 (and (array_inv!9204 _values!549) e!253594)))

(declare-fun array_inv!9205 (array!26180) Bool)

(assert (=> start!39734 (array_inv!9205 _keys!709)))

(declare-fun b!427791 () Bool)

(declare-fun res!251025 () Bool)

(assert (=> b!427791 (=> (not res!251025) (not e!253592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427791 (= res!251025 (validMask!0 mask!1025))))

(declare-fun b!427792 () Bool)

(assert (=> b!427792 (= e!253596 (not e!253591))))

(declare-fun res!251023 () Bool)

(assert (=> b!427792 (=> res!251023 e!253591)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427792 (= res!251023 (not (validKeyInArray!0 (select (arr!12539 _keys!709) from!863))))))

(declare-fun lt!195491 () ListLongMap!6217)

(assert (=> b!427792 (= lt!195491 lt!195486)))

(declare-fun lt!195488 () ListLongMap!6217)

(assert (=> b!427792 (= lt!195486 (+!1337 lt!195488 (tuple2!7303 k0!794 v!412)))))

(assert (=> b!427792 (= lt!195491 (getCurrentListMapNoExtraKeys!1370 lt!195489 lt!195485 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427792 (= lt!195488 (getCurrentListMapNoExtraKeys!1370 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12549 0))(
  ( (Unit!12550) )
))
(declare-fun lt!195490 () Unit!12549)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!521 (array!26180 array!26182 (_ BitVec 32) (_ BitVec 32) V!15995 V!15995 (_ BitVec 32) (_ BitVec 64) V!15995 (_ BitVec 32) Int) Unit!12549)

(assert (=> b!427792 (= lt!195490 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427793 () Bool)

(declare-fun res!251019 () Bool)

(assert (=> b!427793 (=> (not res!251019) (not e!253592))))

(assert (=> b!427793 (= res!251019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427794 () Bool)

(declare-fun res!251029 () Bool)

(assert (=> b!427794 (=> (not res!251029) (not e!253592))))

(declare-fun arrayContainsKey!0 (array!26180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427794 (= res!251029 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427795 () Bool)

(declare-fun res!251028 () Bool)

(assert (=> b!427795 (=> (not res!251028) (not e!253592))))

(assert (=> b!427795 (= res!251028 (validKeyInArray!0 k0!794))))

(declare-fun b!427796 () Bool)

(assert (=> b!427796 (= e!253590 tp_is_empty!11167)))

(declare-fun mapNonEmpty!18372 () Bool)

(declare-fun tp!35573 () Bool)

(declare-fun e!253595 () Bool)

(assert (=> mapNonEmpty!18372 (= mapRes!18372 (and tp!35573 e!253595))))

(declare-fun mapKey!18372 () (_ BitVec 32))

(declare-fun mapRest!18372 () (Array (_ BitVec 32) ValueCell!5240))

(declare-fun mapValue!18372 () ValueCell!5240)

(assert (=> mapNonEmpty!18372 (= (arr!12540 _values!549) (store mapRest!18372 mapKey!18372 mapValue!18372))))

(declare-fun b!427797 () Bool)

(declare-fun res!251030 () Bool)

(assert (=> b!427797 (=> (not res!251030) (not e!253593))))

(assert (=> b!427797 (= res!251030 (bvsle from!863 i!563))))

(declare-fun b!427798 () Bool)

(assert (=> b!427798 (= e!253595 tp_is_empty!11167)))

(assert (= (and start!39734 res!251024) b!427791))

(assert (= (and b!427791 res!251025) b!427784))

(assert (= (and b!427784 res!251021) b!427793))

(assert (= (and b!427793 res!251019) b!427787))

(assert (= (and b!427787 res!251026) b!427788))

(assert (= (and b!427788 res!251020) b!427795))

(assert (= (and b!427795 res!251028) b!427790))

(assert (= (and b!427790 res!251018) b!427794))

(assert (= (and b!427794 res!251029) b!427782))

(assert (= (and b!427782 res!251031) b!427783))

(assert (= (and b!427783 res!251027) b!427797))

(assert (= (and b!427797 res!251030) b!427785))

(assert (= (and b!427785 res!251022) b!427792))

(assert (= (and b!427792 (not res!251023)) b!427786))

(assert (= (and b!427789 condMapEmpty!18372) mapIsEmpty!18372))

(assert (= (and b!427789 (not condMapEmpty!18372)) mapNonEmpty!18372))

(get-info :version)

(assert (= (and mapNonEmpty!18372 ((_ is ValueCellFull!5240) mapValue!18372)) b!427798))

(assert (= (and b!427789 ((_ is ValueCellFull!5240) mapDefault!18372)) b!427796))

(assert (= start!39734 b!427789))

(declare-fun b_lambda!9125 () Bool)

(assert (=> (not b_lambda!9125) (not b!427786)))

(declare-fun t!12760 () Bool)

(declare-fun tb!3413 () Bool)

(assert (=> (and start!39734 (= defaultEntry!557 defaultEntry!557) t!12760) tb!3413))

(declare-fun result!6361 () Bool)

(assert (=> tb!3413 (= result!6361 tp_is_empty!11167)))

(assert (=> b!427786 t!12760))

(declare-fun b_and!17705 () Bool)

(assert (= b_and!17703 (and (=> t!12760 result!6361) b_and!17705)))

(declare-fun m!416525 () Bool)

(assert (=> b!427787 m!416525))

(declare-fun m!416527 () Bool)

(assert (=> start!39734 m!416527))

(declare-fun m!416529 () Bool)

(assert (=> start!39734 m!416529))

(declare-fun m!416531 () Bool)

(assert (=> b!427795 m!416531))

(declare-fun m!416533 () Bool)

(assert (=> b!427792 m!416533))

(declare-fun m!416535 () Bool)

(assert (=> b!427792 m!416535))

(declare-fun m!416537 () Bool)

(assert (=> b!427792 m!416537))

(declare-fun m!416539 () Bool)

(assert (=> b!427792 m!416539))

(assert (=> b!427792 m!416533))

(declare-fun m!416541 () Bool)

(assert (=> b!427792 m!416541))

(declare-fun m!416543 () Bool)

(assert (=> b!427792 m!416543))

(declare-fun m!416545 () Bool)

(assert (=> b!427785 m!416545))

(declare-fun m!416547 () Bool)

(assert (=> b!427785 m!416547))

(declare-fun m!416549 () Bool)

(assert (=> b!427785 m!416549))

(declare-fun m!416551 () Bool)

(assert (=> b!427790 m!416551))

(declare-fun m!416553 () Bool)

(assert (=> mapNonEmpty!18372 m!416553))

(declare-fun m!416555 () Bool)

(assert (=> b!427793 m!416555))

(declare-fun m!416557 () Bool)

(assert (=> b!427782 m!416557))

(declare-fun m!416559 () Bool)

(assert (=> b!427782 m!416559))

(declare-fun m!416561 () Bool)

(assert (=> b!427791 m!416561))

(assert (=> b!427786 m!416533))

(declare-fun m!416563 () Bool)

(assert (=> b!427786 m!416563))

(declare-fun m!416565 () Bool)

(assert (=> b!427786 m!416565))

(declare-fun m!416567 () Bool)

(assert (=> b!427786 m!416567))

(assert (=> b!427786 m!416565))

(assert (=> b!427786 m!416563))

(declare-fun m!416569 () Bool)

(assert (=> b!427786 m!416569))

(declare-fun m!416571 () Bool)

(assert (=> b!427794 m!416571))

(declare-fun m!416573 () Bool)

(assert (=> b!427783 m!416573))

(check-sat (not b!427793) (not b_lambda!9125) (not b!427795) (not b!427792) tp_is_empty!11167 (not b!427786) (not b!427782) b_and!17705 (not b!427787) (not b!427791) (not b_next!10015) (not b!427783) (not start!39734) (not b!427785) (not b!427794) (not mapNonEmpty!18372))
(check-sat b_and!17705 (not b_next!10015))
