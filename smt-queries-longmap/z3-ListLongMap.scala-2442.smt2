; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38456 () Bool)

(assert start!38456)

(declare-fun b!396790 () Bool)

(declare-fun e!240007 () Bool)

(declare-fun e!240009 () Bool)

(declare-fun mapRes!16455 () Bool)

(assert (=> b!396790 (= e!240007 (and e!240009 mapRes!16455))))

(declare-fun condMapEmpty!16455 () Bool)

(declare-datatypes ((V!14291 0))(
  ( (V!14292 (val!4989 Int)) )
))
(declare-datatypes ((ValueCell!4601 0))(
  ( (ValueCellFull!4601 (v!7230 V!14291)) (EmptyCell!4601) )
))
(declare-datatypes ((array!23673 0))(
  ( (array!23674 (arr!11286 (Array (_ BitVec 32) ValueCell!4601)) (size!11639 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23673)

(declare-fun mapDefault!16455 () ValueCell!4601)

(assert (=> b!396790 (= condMapEmpty!16455 (= (arr!11286 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4601)) mapDefault!16455)))))

(declare-fun b!396791 () Bool)

(declare-fun res!227781 () Bool)

(declare-fun e!240008 () Bool)

(assert (=> b!396791 (=> (not res!227781) (not e!240008))))

(declare-datatypes ((array!23675 0))(
  ( (array!23676 (arr!11287 (Array (_ BitVec 32) (_ BitVec 64))) (size!11640 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23675)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396791 (= res!227781 (and (= (size!11639 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11640 _keys!709) (size!11639 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396792 () Bool)

(declare-fun e!240012 () Bool)

(assert (=> b!396792 (= e!240008 e!240012)))

(declare-fun res!227790 () Bool)

(assert (=> b!396792 (=> (not res!227790) (not e!240012))))

(declare-fun lt!187012 () array!23675)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23675 (_ BitVec 32)) Bool)

(assert (=> b!396792 (= res!227790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187012 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!396792 (= lt!187012 (array!23676 (store (arr!11287 _keys!709) i!563 k0!794) (size!11640 _keys!709)))))

(declare-fun b!396793 () Bool)

(declare-fun res!227783 () Bool)

(assert (=> b!396793 (=> (not res!227783) (not e!240008))))

(assert (=> b!396793 (= res!227783 (or (= (select (arr!11287 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11287 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396794 () Bool)

(declare-fun e!240011 () Bool)

(declare-fun tp_is_empty!9889 () Bool)

(assert (=> b!396794 (= e!240011 tp_is_empty!9889)))

(declare-fun b!396795 () Bool)

(assert (=> b!396795 (= e!240009 tp_is_empty!9889)))

(declare-fun b!396796 () Bool)

(declare-fun res!227782 () Bool)

(assert (=> b!396796 (=> (not res!227782) (not e!240008))))

(declare-datatypes ((List!6500 0))(
  ( (Nil!6497) (Cons!6496 (h!7352 (_ BitVec 64)) (t!11665 List!6500)) )
))
(declare-fun arrayNoDuplicates!0 (array!23675 (_ BitVec 32) List!6500) Bool)

(assert (=> b!396796 (= res!227782 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6497))))

(declare-fun b!396797 () Bool)

(assert (=> b!396797 (= e!240012 false)))

(declare-fun lt!187013 () Bool)

(assert (=> b!396797 (= lt!187013 (arrayNoDuplicates!0 lt!187012 #b00000000000000000000000000000000 Nil!6497))))

(declare-fun b!396798 () Bool)

(declare-fun res!227786 () Bool)

(assert (=> b!396798 (=> (not res!227786) (not e!240008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396798 (= res!227786 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16455 () Bool)

(assert (=> mapIsEmpty!16455 mapRes!16455))

(declare-fun b!396799 () Bool)

(declare-fun res!227784 () Bool)

(assert (=> b!396799 (=> (not res!227784) (not e!240008))))

(assert (=> b!396799 (= res!227784 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11640 _keys!709))))))

(declare-fun res!227789 () Bool)

(assert (=> start!38456 (=> (not res!227789) (not e!240008))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38456 (= res!227789 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11640 _keys!709))))))

(assert (=> start!38456 e!240008))

(assert (=> start!38456 true))

(declare-fun array_inv!8286 (array!23673) Bool)

(assert (=> start!38456 (and (array_inv!8286 _values!549) e!240007)))

(declare-fun array_inv!8287 (array!23675) Bool)

(assert (=> start!38456 (array_inv!8287 _keys!709)))

(declare-fun mapNonEmpty!16455 () Bool)

(declare-fun tp!32250 () Bool)

(assert (=> mapNonEmpty!16455 (= mapRes!16455 (and tp!32250 e!240011))))

(declare-fun mapValue!16455 () ValueCell!4601)

(declare-fun mapKey!16455 () (_ BitVec 32))

(declare-fun mapRest!16455 () (Array (_ BitVec 32) ValueCell!4601))

(assert (=> mapNonEmpty!16455 (= (arr!11286 _values!549) (store mapRest!16455 mapKey!16455 mapValue!16455))))

(declare-fun b!396800 () Bool)

(declare-fun res!227788 () Bool)

(assert (=> b!396800 (=> (not res!227788) (not e!240008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396800 (= res!227788 (validKeyInArray!0 k0!794))))

(declare-fun b!396801 () Bool)

(declare-fun res!227787 () Bool)

(assert (=> b!396801 (=> (not res!227787) (not e!240008))))

(declare-fun arrayContainsKey!0 (array!23675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396801 (= res!227787 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396802 () Bool)

(declare-fun res!227785 () Bool)

(assert (=> b!396802 (=> (not res!227785) (not e!240008))))

(assert (=> b!396802 (= res!227785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38456 res!227789) b!396798))

(assert (= (and b!396798 res!227786) b!396791))

(assert (= (and b!396791 res!227781) b!396802))

(assert (= (and b!396802 res!227785) b!396796))

(assert (= (and b!396796 res!227782) b!396799))

(assert (= (and b!396799 res!227784) b!396800))

(assert (= (and b!396800 res!227788) b!396793))

(assert (= (and b!396793 res!227783) b!396801))

(assert (= (and b!396801 res!227787) b!396792))

(assert (= (and b!396792 res!227790) b!396797))

(assert (= (and b!396790 condMapEmpty!16455) mapIsEmpty!16455))

(assert (= (and b!396790 (not condMapEmpty!16455)) mapNonEmpty!16455))

(get-info :version)

(assert (= (and mapNonEmpty!16455 ((_ is ValueCellFull!4601) mapValue!16455)) b!396794))

(assert (= (and b!396790 ((_ is ValueCellFull!4601) mapDefault!16455)) b!396795))

(assert (= start!38456 b!396790))

(declare-fun m!391731 () Bool)

(assert (=> b!396798 m!391731))

(declare-fun m!391733 () Bool)

(assert (=> b!396797 m!391733))

(declare-fun m!391735 () Bool)

(assert (=> b!396796 m!391735))

(declare-fun m!391737 () Bool)

(assert (=> b!396792 m!391737))

(declare-fun m!391739 () Bool)

(assert (=> b!396792 m!391739))

(declare-fun m!391741 () Bool)

(assert (=> b!396801 m!391741))

(declare-fun m!391743 () Bool)

(assert (=> b!396793 m!391743))

(declare-fun m!391745 () Bool)

(assert (=> b!396800 m!391745))

(declare-fun m!391747 () Bool)

(assert (=> mapNonEmpty!16455 m!391747))

(declare-fun m!391749 () Bool)

(assert (=> b!396802 m!391749))

(declare-fun m!391751 () Bool)

(assert (=> start!38456 m!391751))

(declare-fun m!391753 () Bool)

(assert (=> start!38456 m!391753))

(check-sat (not b!396796) (not start!38456) tp_is_empty!9889 (not b!396800) (not b!396792) (not b!396798) (not mapNonEmpty!16455) (not b!396801) (not b!396802) (not b!396797))
(check-sat)
