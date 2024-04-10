; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39126 () Bool)

(assert start!39126)

(declare-fun b_free!9393 () Bool)

(declare-fun b_next!9393 () Bool)

(assert (=> start!39126 (= b_free!9393 (not b_next!9393))))

(declare-fun tp!33708 () Bool)

(declare-fun b_and!16779 () Bool)

(assert (=> start!39126 (= tp!33708 b_and!16779)))

(declare-fun b!411447 () Bool)

(declare-fun res!238698 () Bool)

(declare-fun e!246411 () Bool)

(assert (=> b!411447 (=> (not res!238698) (not e!246411))))

(declare-datatypes ((array!24951 0))(
  ( (array!24952 (arr!11925 (Array (_ BitVec 32) (_ BitVec 64))) (size!12277 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24951)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24951 (_ BitVec 32)) Bool)

(assert (=> b!411447 (= res!238698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411448 () Bool)

(declare-fun res!238705 () Bool)

(assert (=> b!411448 (=> (not res!238705) (not e!246411))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411448 (= res!238705 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12277 _keys!709))))))

(declare-fun mapNonEmpty!17439 () Bool)

(declare-fun mapRes!17439 () Bool)

(declare-fun tp!33707 () Bool)

(declare-fun e!246409 () Bool)

(assert (=> mapNonEmpty!17439 (= mapRes!17439 (and tp!33707 e!246409))))

(declare-datatypes ((V!15165 0))(
  ( (V!15166 (val!5317 Int)) )
))
(declare-datatypes ((ValueCell!4929 0))(
  ( (ValueCellFull!4929 (v!7564 V!15165)) (EmptyCell!4929) )
))
(declare-datatypes ((array!24953 0))(
  ( (array!24954 (arr!11926 (Array (_ BitVec 32) ValueCell!4929)) (size!12278 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24953)

(declare-fun mapRest!17439 () (Array (_ BitVec 32) ValueCell!4929))

(declare-fun mapKey!17439 () (_ BitVec 32))

(declare-fun mapValue!17439 () ValueCell!4929)

(assert (=> mapNonEmpty!17439 (= (arr!11926 _values!549) (store mapRest!17439 mapKey!17439 mapValue!17439))))

(declare-fun res!238700 () Bool)

(assert (=> start!39126 (=> (not res!238700) (not e!246411))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39126 (= res!238700 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12277 _keys!709))))))

(assert (=> start!39126 e!246411))

(declare-fun tp_is_empty!10545 () Bool)

(assert (=> start!39126 tp_is_empty!10545))

(assert (=> start!39126 tp!33708))

(assert (=> start!39126 true))

(declare-fun e!246413 () Bool)

(declare-fun array_inv!8700 (array!24953) Bool)

(assert (=> start!39126 (and (array_inv!8700 _values!549) e!246413)))

(declare-fun array_inv!8701 (array!24951) Bool)

(assert (=> start!39126 (array_inv!8701 _keys!709)))

(declare-fun b!411449 () Bool)

(assert (=> b!411449 (= e!246409 tp_is_empty!10545)))

(declare-fun b!411450 () Bool)

(declare-fun res!238703 () Bool)

(declare-fun e!246410 () Bool)

(assert (=> b!411450 (=> (not res!238703) (not e!246410))))

(assert (=> b!411450 (= res!238703 (bvsle from!863 i!563))))

(declare-fun b!411451 () Bool)

(declare-fun res!238706 () Bool)

(assert (=> b!411451 (=> (not res!238706) (not e!246411))))

(declare-datatypes ((List!6923 0))(
  ( (Nil!6920) (Cons!6919 (h!7775 (_ BitVec 64)) (t!12097 List!6923)) )
))
(declare-fun arrayNoDuplicates!0 (array!24951 (_ BitVec 32) List!6923) Bool)

(assert (=> b!411451 (= res!238706 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6920))))

(declare-fun b!411452 () Bool)

(assert (=> b!411452 (= e!246410 false)))

(declare-fun minValue!515 () V!15165)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15165)

(declare-datatypes ((tuple2!6898 0))(
  ( (tuple2!6899 (_1!3460 (_ BitVec 64)) (_2!3460 V!15165)) )
))
(declare-datatypes ((List!6924 0))(
  ( (Nil!6921) (Cons!6920 (h!7776 tuple2!6898) (t!12098 List!6924)) )
))
(declare-datatypes ((ListLongMap!5811 0))(
  ( (ListLongMap!5812 (toList!2921 List!6924)) )
))
(declare-fun lt!189283 () ListLongMap!5811)

(declare-fun v!412 () V!15165)

(declare-fun lt!189284 () array!24951)

(declare-fun getCurrentListMapNoExtraKeys!1129 (array!24951 array!24953 (_ BitVec 32) (_ BitVec 32) V!15165 V!15165 (_ BitVec 32) Int) ListLongMap!5811)

(assert (=> b!411452 (= lt!189283 (getCurrentListMapNoExtraKeys!1129 lt!189284 (array!24954 (store (arr!11926 _values!549) i!563 (ValueCellFull!4929 v!412)) (size!12278 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189282 () ListLongMap!5811)

(assert (=> b!411452 (= lt!189282 (getCurrentListMapNoExtraKeys!1129 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411453 () Bool)

(declare-fun res!238697 () Bool)

(assert (=> b!411453 (=> (not res!238697) (not e!246411))))

(assert (=> b!411453 (= res!238697 (or (= (select (arr!11925 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11925 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411454 () Bool)

(declare-fun res!238704 () Bool)

(assert (=> b!411454 (=> (not res!238704) (not e!246411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411454 (= res!238704 (validMask!0 mask!1025))))

(declare-fun b!411455 () Bool)

(declare-fun res!238707 () Bool)

(assert (=> b!411455 (=> (not res!238707) (not e!246411))))

(assert (=> b!411455 (= res!238707 (and (= (size!12278 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12277 _keys!709) (size!12278 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411456 () Bool)

(declare-fun res!238696 () Bool)

(assert (=> b!411456 (=> (not res!238696) (not e!246410))))

(assert (=> b!411456 (= res!238696 (arrayNoDuplicates!0 lt!189284 #b00000000000000000000000000000000 Nil!6920))))

(declare-fun mapIsEmpty!17439 () Bool)

(assert (=> mapIsEmpty!17439 mapRes!17439))

(declare-fun b!411457 () Bool)

(declare-fun e!246414 () Bool)

(assert (=> b!411457 (= e!246414 tp_is_empty!10545)))

(declare-fun b!411458 () Bool)

(declare-fun res!238702 () Bool)

(assert (=> b!411458 (=> (not res!238702) (not e!246411))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411458 (= res!238702 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411459 () Bool)

(assert (=> b!411459 (= e!246413 (and e!246414 mapRes!17439))))

(declare-fun condMapEmpty!17439 () Bool)

(declare-fun mapDefault!17439 () ValueCell!4929)

(assert (=> b!411459 (= condMapEmpty!17439 (= (arr!11926 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4929)) mapDefault!17439)))))

(declare-fun b!411460 () Bool)

(declare-fun res!238701 () Bool)

(assert (=> b!411460 (=> (not res!238701) (not e!246411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411460 (= res!238701 (validKeyInArray!0 k0!794))))

(declare-fun b!411461 () Bool)

(assert (=> b!411461 (= e!246411 e!246410)))

(declare-fun res!238699 () Bool)

(assert (=> b!411461 (=> (not res!238699) (not e!246410))))

(assert (=> b!411461 (= res!238699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189284 mask!1025))))

(assert (=> b!411461 (= lt!189284 (array!24952 (store (arr!11925 _keys!709) i!563 k0!794) (size!12277 _keys!709)))))

(assert (= (and start!39126 res!238700) b!411454))

(assert (= (and b!411454 res!238704) b!411455))

(assert (= (and b!411455 res!238707) b!411447))

(assert (= (and b!411447 res!238698) b!411451))

(assert (= (and b!411451 res!238706) b!411448))

(assert (= (and b!411448 res!238705) b!411460))

(assert (= (and b!411460 res!238701) b!411453))

(assert (= (and b!411453 res!238697) b!411458))

(assert (= (and b!411458 res!238702) b!411461))

(assert (= (and b!411461 res!238699) b!411456))

(assert (= (and b!411456 res!238696) b!411450))

(assert (= (and b!411450 res!238703) b!411452))

(assert (= (and b!411459 condMapEmpty!17439) mapIsEmpty!17439))

(assert (= (and b!411459 (not condMapEmpty!17439)) mapNonEmpty!17439))

(get-info :version)

(assert (= (and mapNonEmpty!17439 ((_ is ValueCellFull!4929) mapValue!17439)) b!411449))

(assert (= (and b!411459 ((_ is ValueCellFull!4929) mapDefault!17439)) b!411457))

(assert (= start!39126 b!411459))

(declare-fun m!401593 () Bool)

(assert (=> start!39126 m!401593))

(declare-fun m!401595 () Bool)

(assert (=> start!39126 m!401595))

(declare-fun m!401597 () Bool)

(assert (=> mapNonEmpty!17439 m!401597))

(declare-fun m!401599 () Bool)

(assert (=> b!411453 m!401599))

(declare-fun m!401601 () Bool)

(assert (=> b!411451 m!401601))

(declare-fun m!401603 () Bool)

(assert (=> b!411460 m!401603))

(declare-fun m!401605 () Bool)

(assert (=> b!411452 m!401605))

(declare-fun m!401607 () Bool)

(assert (=> b!411452 m!401607))

(declare-fun m!401609 () Bool)

(assert (=> b!411452 m!401609))

(declare-fun m!401611 () Bool)

(assert (=> b!411461 m!401611))

(declare-fun m!401613 () Bool)

(assert (=> b!411461 m!401613))

(declare-fun m!401615 () Bool)

(assert (=> b!411458 m!401615))

(declare-fun m!401617 () Bool)

(assert (=> b!411447 m!401617))

(declare-fun m!401619 () Bool)

(assert (=> b!411456 m!401619))

(declare-fun m!401621 () Bool)

(assert (=> b!411454 m!401621))

(check-sat (not b!411461) (not b!411451) (not b!411452) (not b!411458) (not b!411456) (not b_next!9393) (not start!39126) (not mapNonEmpty!17439) tp_is_empty!10545 b_and!16779 (not b!411447) (not b!411460) (not b!411454))
(check-sat b_and!16779 (not b_next!9393))
