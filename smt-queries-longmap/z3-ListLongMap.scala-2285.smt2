; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37174 () Bool)

(assert start!37174)

(declare-fun b_free!8301 () Bool)

(declare-fun b_next!8301 () Bool)

(assert (=> start!37174 (= b_free!8301 (not b_next!8301))))

(declare-fun tp!29618 () Bool)

(declare-fun b_and!15543 () Bool)

(assert (=> start!37174 (= tp!29618 b_and!15543)))

(declare-fun b!375207 () Bool)

(declare-fun e!228614 () Bool)

(declare-fun e!228608 () Bool)

(assert (=> b!375207 (= e!228614 e!228608)))

(declare-fun res!211763 () Bool)

(assert (=> b!375207 (=> res!211763 e!228608)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!375207 (= res!211763 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13037 0))(
  ( (V!13038 (val!4519 Int)) )
))
(declare-datatypes ((tuple2!6014 0))(
  ( (tuple2!6015 (_1!3018 (_ BitVec 64)) (_2!3018 V!13037)) )
))
(declare-datatypes ((List!5856 0))(
  ( (Nil!5853) (Cons!5852 (h!6708 tuple2!6014) (t!11006 List!5856)) )
))
(declare-datatypes ((ListLongMap!4927 0))(
  ( (ListLongMap!4928 (toList!2479 List!5856)) )
))
(declare-fun lt!173495 () ListLongMap!4927)

(declare-fun lt!173485 () ListLongMap!4927)

(assert (=> b!375207 (= lt!173495 lt!173485)))

(declare-fun lt!173492 () ListLongMap!4927)

(declare-fun lt!173490 () tuple2!6014)

(declare-fun +!825 (ListLongMap!4927 tuple2!6014) ListLongMap!4927)

(assert (=> b!375207 (= lt!173485 (+!825 lt!173492 lt!173490))))

(declare-fun v!373 () V!13037)

(declare-fun zeroValue!472 () V!13037)

(declare-fun lt!173486 () ListLongMap!4927)

(declare-datatypes ((Unit!11556 0))(
  ( (Unit!11557) )
))
(declare-fun lt!173482 () Unit!11556)

(declare-fun addCommutativeForDiffKeys!246 (ListLongMap!4927 (_ BitVec 64) V!13037 (_ BitVec 64) V!13037) Unit!11556)

(assert (=> b!375207 (= lt!173482 (addCommutativeForDiffKeys!246 lt!173486 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173489 () ListLongMap!4927)

(declare-fun lt!173494 () tuple2!6014)

(assert (=> b!375207 (= lt!173489 (+!825 lt!173495 lt!173494))))

(declare-fun lt!173488 () ListLongMap!4927)

(declare-fun lt!173481 () tuple2!6014)

(assert (=> b!375207 (= lt!173495 (+!825 lt!173488 lt!173481))))

(declare-fun lt!173493 () ListLongMap!4927)

(declare-fun lt!173496 () ListLongMap!4927)

(assert (=> b!375207 (= lt!173493 lt!173496)))

(assert (=> b!375207 (= lt!173496 (+!825 lt!173492 lt!173494))))

(assert (=> b!375207 (= lt!173492 (+!825 lt!173486 lt!173481))))

(declare-fun lt!173487 () ListLongMap!4927)

(assert (=> b!375207 (= lt!173489 (+!825 (+!825 lt!173487 lt!173481) lt!173494))))

(declare-fun minValue!472 () V!13037)

(assert (=> b!375207 (= lt!173494 (tuple2!6015 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375207 (= lt!173481 (tuple2!6015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14988 () Bool)

(declare-fun mapRes!14988 () Bool)

(declare-fun tp!29619 () Bool)

(declare-fun e!228611 () Bool)

(assert (=> mapNonEmpty!14988 (= mapRes!14988 (and tp!29619 e!228611))))

(declare-datatypes ((ValueCell!4131 0))(
  ( (ValueCellFull!4131 (v!6716 V!13037)) (EmptyCell!4131) )
))
(declare-datatypes ((array!21833 0))(
  ( (array!21834 (arr!10385 (Array (_ BitVec 32) ValueCell!4131)) (size!10737 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21833)

(declare-fun mapKey!14988 () (_ BitVec 32))

(declare-fun mapValue!14988 () ValueCell!4131)

(declare-fun mapRest!14988 () (Array (_ BitVec 32) ValueCell!4131))

(assert (=> mapNonEmpty!14988 (= (arr!10385 _values!506) (store mapRest!14988 mapKey!14988 mapValue!14988))))

(declare-fun b!375208 () Bool)

(declare-fun res!211766 () Bool)

(declare-fun e!228609 () Bool)

(assert (=> b!375208 (=> (not res!211766) (not e!228609))))

(declare-datatypes ((array!21835 0))(
  ( (array!21836 (arr!10386 (Array (_ BitVec 32) (_ BitVec 64))) (size!10738 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21835)

(declare-datatypes ((List!5857 0))(
  ( (Nil!5854) (Cons!5853 (h!6709 (_ BitVec 64)) (t!11007 List!5857)) )
))
(declare-fun arrayNoDuplicates!0 (array!21835 (_ BitVec 32) List!5857) Bool)

(assert (=> b!375208 (= res!211766 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5854))))

(declare-fun b!375209 () Bool)

(declare-fun e!228610 () Bool)

(assert (=> b!375209 (= e!228610 (not e!228614))))

(declare-fun res!211760 () Bool)

(assert (=> b!375209 (=> res!211760 e!228614)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375209 (= res!211760 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1914 (array!21835 array!21833 (_ BitVec 32) (_ BitVec 32) V!13037 V!13037 (_ BitVec 32) Int) ListLongMap!4927)

(assert (=> b!375209 (= lt!173493 (getCurrentListMap!1914 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173480 () array!21835)

(declare-fun lt!173483 () array!21833)

(assert (=> b!375209 (= lt!173489 (getCurrentListMap!1914 lt!173480 lt!173483 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375209 (and (= lt!173487 lt!173488) (= lt!173488 lt!173487))))

(assert (=> b!375209 (= lt!173488 (+!825 lt!173486 lt!173490))))

(assert (=> b!375209 (= lt!173490 (tuple2!6015 k0!778 v!373))))

(declare-fun lt!173491 () Unit!11556)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!72 (array!21835 array!21833 (_ BitVec 32) (_ BitVec 32) V!13037 V!13037 (_ BitVec 32) (_ BitVec 64) V!13037 (_ BitVec 32) Int) Unit!11556)

(assert (=> b!375209 (= lt!173491 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!72 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!748 (array!21835 array!21833 (_ BitVec 32) (_ BitVec 32) V!13037 V!13037 (_ BitVec 32) Int) ListLongMap!4927)

(assert (=> b!375209 (= lt!173487 (getCurrentListMapNoExtraKeys!748 lt!173480 lt!173483 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375209 (= lt!173483 (array!21834 (store (arr!10385 _values!506) i!548 (ValueCellFull!4131 v!373)) (size!10737 _values!506)))))

(assert (=> b!375209 (= lt!173486 (getCurrentListMapNoExtraKeys!748 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375210 () Bool)

(declare-fun res!211762 () Bool)

(assert (=> b!375210 (=> (not res!211762) (not e!228609))))

(assert (=> b!375210 (= res!211762 (or (= (select (arr!10386 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10386 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375211 () Bool)

(assert (=> b!375211 (= e!228609 e!228610)))

(declare-fun res!211759 () Bool)

(assert (=> b!375211 (=> (not res!211759) (not e!228610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21835 (_ BitVec 32)) Bool)

(assert (=> b!375211 (= res!211759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173480 mask!970))))

(assert (=> b!375211 (= lt!173480 (array!21836 (store (arr!10386 _keys!658) i!548 k0!778) (size!10738 _keys!658)))))

(declare-fun b!375212 () Bool)

(declare-fun res!211767 () Bool)

(assert (=> b!375212 (=> (not res!211767) (not e!228609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375212 (= res!211767 (validKeyInArray!0 k0!778))))

(declare-fun b!375213 () Bool)

(declare-fun res!211768 () Bool)

(assert (=> b!375213 (=> (not res!211768) (not e!228610))))

(assert (=> b!375213 (= res!211768 (arrayNoDuplicates!0 lt!173480 #b00000000000000000000000000000000 Nil!5854))))

(declare-fun b!375214 () Bool)

(assert (=> b!375214 (= e!228608 true)))

(assert (=> b!375214 (= (+!825 lt!173485 lt!173494) (+!825 lt!173496 lt!173490))))

(declare-fun lt!173484 () Unit!11556)

(assert (=> b!375214 (= lt!173484 (addCommutativeForDiffKeys!246 lt!173492 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!14988 () Bool)

(assert (=> mapIsEmpty!14988 mapRes!14988))

(declare-fun res!211769 () Bool)

(assert (=> start!37174 (=> (not res!211769) (not e!228609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37174 (= res!211769 (validMask!0 mask!970))))

(assert (=> start!37174 e!228609))

(declare-fun e!228612 () Bool)

(declare-fun array_inv!7658 (array!21833) Bool)

(assert (=> start!37174 (and (array_inv!7658 _values!506) e!228612)))

(assert (=> start!37174 tp!29618))

(assert (=> start!37174 true))

(declare-fun tp_is_empty!8949 () Bool)

(assert (=> start!37174 tp_is_empty!8949))

(declare-fun array_inv!7659 (array!21835) Bool)

(assert (=> start!37174 (array_inv!7659 _keys!658)))

(declare-fun b!375215 () Bool)

(assert (=> b!375215 (= e!228611 tp_is_empty!8949)))

(declare-fun b!375216 () Bool)

(declare-fun res!211758 () Bool)

(assert (=> b!375216 (=> (not res!211758) (not e!228609))))

(assert (=> b!375216 (= res!211758 (and (= (size!10737 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10738 _keys!658) (size!10737 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375217 () Bool)

(declare-fun res!211761 () Bool)

(assert (=> b!375217 (=> (not res!211761) (not e!228609))))

(declare-fun arrayContainsKey!0 (array!21835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375217 (= res!211761 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375218 () Bool)

(declare-fun e!228613 () Bool)

(assert (=> b!375218 (= e!228613 tp_is_empty!8949)))

(declare-fun b!375219 () Bool)

(assert (=> b!375219 (= e!228612 (and e!228613 mapRes!14988))))

(declare-fun condMapEmpty!14988 () Bool)

(declare-fun mapDefault!14988 () ValueCell!4131)

(assert (=> b!375219 (= condMapEmpty!14988 (= (arr!10385 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4131)) mapDefault!14988)))))

(declare-fun b!375220 () Bool)

(declare-fun res!211765 () Bool)

(assert (=> b!375220 (=> (not res!211765) (not e!228609))))

(assert (=> b!375220 (= res!211765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375221 () Bool)

(declare-fun res!211764 () Bool)

(assert (=> b!375221 (=> (not res!211764) (not e!228609))))

(assert (=> b!375221 (= res!211764 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10738 _keys!658))))))

(assert (= (and start!37174 res!211769) b!375216))

(assert (= (and b!375216 res!211758) b!375220))

(assert (= (and b!375220 res!211765) b!375208))

(assert (= (and b!375208 res!211766) b!375221))

(assert (= (and b!375221 res!211764) b!375212))

(assert (= (and b!375212 res!211767) b!375210))

(assert (= (and b!375210 res!211762) b!375217))

(assert (= (and b!375217 res!211761) b!375211))

(assert (= (and b!375211 res!211759) b!375213))

(assert (= (and b!375213 res!211768) b!375209))

(assert (= (and b!375209 (not res!211760)) b!375207))

(assert (= (and b!375207 (not res!211763)) b!375214))

(assert (= (and b!375219 condMapEmpty!14988) mapIsEmpty!14988))

(assert (= (and b!375219 (not condMapEmpty!14988)) mapNonEmpty!14988))

(get-info :version)

(assert (= (and mapNonEmpty!14988 ((_ is ValueCellFull!4131) mapValue!14988)) b!375215))

(assert (= (and b!375219 ((_ is ValueCellFull!4131) mapDefault!14988)) b!375218))

(assert (= start!37174 b!375219))

(declare-fun m!371715 () Bool)

(assert (=> mapNonEmpty!14988 m!371715))

(declare-fun m!371717 () Bool)

(assert (=> b!375213 m!371717))

(declare-fun m!371719 () Bool)

(assert (=> b!375209 m!371719))

(declare-fun m!371721 () Bool)

(assert (=> b!375209 m!371721))

(declare-fun m!371723 () Bool)

(assert (=> b!375209 m!371723))

(declare-fun m!371725 () Bool)

(assert (=> b!375209 m!371725))

(declare-fun m!371727 () Bool)

(assert (=> b!375209 m!371727))

(declare-fun m!371729 () Bool)

(assert (=> b!375209 m!371729))

(declare-fun m!371731 () Bool)

(assert (=> b!375209 m!371731))

(declare-fun m!371733 () Bool)

(assert (=> start!37174 m!371733))

(declare-fun m!371735 () Bool)

(assert (=> start!37174 m!371735))

(declare-fun m!371737 () Bool)

(assert (=> start!37174 m!371737))

(declare-fun m!371739 () Bool)

(assert (=> b!375207 m!371739))

(declare-fun m!371741 () Bool)

(assert (=> b!375207 m!371741))

(declare-fun m!371743 () Bool)

(assert (=> b!375207 m!371743))

(declare-fun m!371745 () Bool)

(assert (=> b!375207 m!371745))

(declare-fun m!371747 () Bool)

(assert (=> b!375207 m!371747))

(declare-fun m!371749 () Bool)

(assert (=> b!375207 m!371749))

(assert (=> b!375207 m!371743))

(declare-fun m!371751 () Bool)

(assert (=> b!375207 m!371751))

(declare-fun m!371753 () Bool)

(assert (=> b!375207 m!371753))

(declare-fun m!371755 () Bool)

(assert (=> b!375214 m!371755))

(declare-fun m!371757 () Bool)

(assert (=> b!375214 m!371757))

(declare-fun m!371759 () Bool)

(assert (=> b!375214 m!371759))

(declare-fun m!371761 () Bool)

(assert (=> b!375208 m!371761))

(declare-fun m!371763 () Bool)

(assert (=> b!375217 m!371763))

(declare-fun m!371765 () Bool)

(assert (=> b!375210 m!371765))

(declare-fun m!371767 () Bool)

(assert (=> b!375211 m!371767))

(declare-fun m!371769 () Bool)

(assert (=> b!375211 m!371769))

(declare-fun m!371771 () Bool)

(assert (=> b!375212 m!371771))

(declare-fun m!371773 () Bool)

(assert (=> b!375220 m!371773))

(check-sat (not b!375209) (not mapNonEmpty!14988) (not b!375214) (not b!375211) (not b!375220) tp_is_empty!8949 (not b!375208) (not b!375212) (not b!375213) b_and!15543 (not b!375207) (not b_next!8301) (not start!37174) (not b!375217))
(check-sat b_and!15543 (not b_next!8301))
