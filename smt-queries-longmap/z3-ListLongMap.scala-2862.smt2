; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41214 () Bool)

(assert start!41214)

(declare-fun b_free!11071 () Bool)

(declare-fun b_next!11071 () Bool)

(assert (=> start!41214 (= b_free!11071 (not b_next!11071))))

(declare-fun tp!39052 () Bool)

(declare-fun b_and!19401 () Bool)

(assert (=> start!41214 (= tp!39052 b_and!19401)))

(declare-fun res!275731 () Bool)

(declare-fun e!268923 () Bool)

(assert (=> start!41214 (=> (not res!275731) (not e!268923))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28614 0))(
  ( (array!28615 (arr!13746 (Array (_ BitVec 32) (_ BitVec 64))) (size!14098 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28614)

(assert (=> start!41214 (= res!275731 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14098 _keys!709))))))

(assert (=> start!41214 e!268923))

(declare-fun tp_is_empty!12409 () Bool)

(assert (=> start!41214 tp_is_empty!12409))

(assert (=> start!41214 tp!39052))

(assert (=> start!41214 true))

(declare-datatypes ((V!17651 0))(
  ( (V!17652 (val!6249 Int)) )
))
(declare-datatypes ((ValueCell!5861 0))(
  ( (ValueCellFull!5861 (v!8532 V!17651)) (EmptyCell!5861) )
))
(declare-datatypes ((array!28616 0))(
  ( (array!28617 (arr!13747 (Array (_ BitVec 32) ValueCell!5861)) (size!14099 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28616)

(declare-fun e!268920 () Bool)

(declare-fun array_inv!10026 (array!28616) Bool)

(assert (=> start!41214 (and (array_inv!10026 _values!549) e!268920)))

(declare-fun array_inv!10027 (array!28614) Bool)

(assert (=> start!41214 (array_inv!10027 _keys!709)))

(declare-fun b!461033 () Bool)

(declare-fun e!268924 () Bool)

(declare-fun mapRes!20266 () Bool)

(assert (=> b!461033 (= e!268920 (and e!268924 mapRes!20266))))

(declare-fun condMapEmpty!20266 () Bool)

(declare-fun mapDefault!20266 () ValueCell!5861)

(assert (=> b!461033 (= condMapEmpty!20266 (= (arr!13747 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5861)) mapDefault!20266)))))

(declare-fun b!461034 () Bool)

(assert (=> b!461034 (= e!268924 tp_is_empty!12409)))

(declare-fun b!461035 () Bool)

(declare-fun res!275728 () Bool)

(assert (=> b!461035 (=> (not res!275728) (not e!268923))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!461035 (= res!275728 (and (= (size!14099 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14098 _keys!709) (size!14099 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20266 () Bool)

(assert (=> mapIsEmpty!20266 mapRes!20266))

(declare-fun b!461036 () Bool)

(declare-fun res!275727 () Bool)

(assert (=> b!461036 (=> (not res!275727) (not e!268923))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461036 (= res!275727 (or (= (select (arr!13746 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13746 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461037 () Bool)

(declare-fun e!268918 () Bool)

(assert (=> b!461037 (= e!268918 tp_is_empty!12409)))

(declare-fun b!461038 () Bool)

(declare-fun res!275733 () Bool)

(assert (=> b!461038 (=> (not res!275733) (not e!268923))))

(declare-datatypes ((List!8239 0))(
  ( (Nil!8236) (Cons!8235 (h!9091 (_ BitVec 64)) (t!14173 List!8239)) )
))
(declare-fun arrayNoDuplicates!0 (array!28614 (_ BitVec 32) List!8239) Bool)

(assert (=> b!461038 (= res!275733 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8236))))

(declare-fun b!461039 () Bool)

(declare-fun res!275740 () Bool)

(assert (=> b!461039 (=> (not res!275740) (not e!268923))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461039 (= res!275740 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!20266 () Bool)

(declare-fun tp!39051 () Bool)

(assert (=> mapNonEmpty!20266 (= mapRes!20266 (and tp!39051 e!268918))))

(declare-fun mapKey!20266 () (_ BitVec 32))

(declare-fun mapRest!20266 () (Array (_ BitVec 32) ValueCell!5861))

(declare-fun mapValue!20266 () ValueCell!5861)

(assert (=> mapNonEmpty!20266 (= (arr!13747 _values!549) (store mapRest!20266 mapKey!20266 mapValue!20266))))

(declare-fun b!461040 () Bool)

(declare-fun res!275729 () Bool)

(declare-fun e!268925 () Bool)

(assert (=> b!461040 (=> (not res!275729) (not e!268925))))

(declare-fun lt!208897 () array!28614)

(assert (=> b!461040 (= res!275729 (arrayNoDuplicates!0 lt!208897 #b00000000000000000000000000000000 Nil!8236))))

(declare-fun b!461041 () Bool)

(declare-fun res!275735 () Bool)

(assert (=> b!461041 (=> (not res!275735) (not e!268923))))

(declare-fun arrayContainsKey!0 (array!28614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461041 (= res!275735 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461042 () Bool)

(assert (=> b!461042 (= e!268923 e!268925)))

(declare-fun res!275730 () Bool)

(assert (=> b!461042 (=> (not res!275730) (not e!268925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28614 (_ BitVec 32)) Bool)

(assert (=> b!461042 (= res!275730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208897 mask!1025))))

(assert (=> b!461042 (= lt!208897 (array!28615 (store (arr!13746 _keys!709) i!563 k0!794) (size!14098 _keys!709)))))

(declare-fun b!461043 () Bool)

(declare-fun res!275732 () Bool)

(assert (=> b!461043 (=> (not res!275732) (not e!268923))))

(assert (=> b!461043 (= res!275732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461044 () Bool)

(declare-fun res!275737 () Bool)

(assert (=> b!461044 (=> (not res!275737) (not e!268923))))

(assert (=> b!461044 (= res!275737 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14098 _keys!709))))))

(declare-fun b!461045 () Bool)

(declare-fun e!268921 () Bool)

(assert (=> b!461045 (= e!268925 e!268921)))

(declare-fun res!275734 () Bool)

(assert (=> b!461045 (=> (not res!275734) (not e!268921))))

(assert (=> b!461045 (= res!275734 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!8176 0))(
  ( (tuple2!8177 (_1!4099 (_ BitVec 64)) (_2!4099 V!17651)) )
))
(declare-datatypes ((List!8240 0))(
  ( (Nil!8237) (Cons!8236 (h!9092 tuple2!8176) (t!14174 List!8240)) )
))
(declare-datatypes ((ListLongMap!7091 0))(
  ( (ListLongMap!7092 (toList!3561 List!8240)) )
))
(declare-fun lt!208899 () ListLongMap!7091)

(declare-fun minValue!515 () V!17651)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17651)

(declare-fun lt!208896 () array!28616)

(declare-fun getCurrentListMapNoExtraKeys!1788 (array!28614 array!28616 (_ BitVec 32) (_ BitVec 32) V!17651 V!17651 (_ BitVec 32) Int) ListLongMap!7091)

(assert (=> b!461045 (= lt!208899 (getCurrentListMapNoExtraKeys!1788 lt!208897 lt!208896 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17651)

(assert (=> b!461045 (= lt!208896 (array!28617 (store (arr!13747 _values!549) i!563 (ValueCellFull!5861 v!412)) (size!14099 _values!549)))))

(declare-fun lt!208898 () ListLongMap!7091)

(assert (=> b!461045 (= lt!208898 (getCurrentListMapNoExtraKeys!1788 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461046 () Bool)

(declare-fun res!275738 () Bool)

(assert (=> b!461046 (=> (not res!275738) (not e!268925))))

(assert (=> b!461046 (= res!275738 (bvsle from!863 i!563))))

(declare-fun b!461047 () Bool)

(declare-fun e!268919 () Bool)

(assert (=> b!461047 (= e!268919 (bvslt i!563 (size!14099 _values!549)))))

(declare-fun b!461048 () Bool)

(declare-fun res!275736 () Bool)

(assert (=> b!461048 (=> (not res!275736) (not e!268923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461048 (= res!275736 (validMask!0 mask!1025))))

(declare-fun b!461049 () Bool)

(assert (=> b!461049 (= e!268921 (not e!268919))))

(declare-fun res!275739 () Bool)

(assert (=> b!461049 (=> res!275739 e!268919)))

(assert (=> b!461049 (= res!275739 (validKeyInArray!0 (select (arr!13746 _keys!709) from!863)))))

(declare-fun +!1636 (ListLongMap!7091 tuple2!8176) ListLongMap!7091)

(assert (=> b!461049 (= (getCurrentListMapNoExtraKeys!1788 lt!208897 lt!208896 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1636 (getCurrentListMapNoExtraKeys!1788 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8177 k0!794 v!412)))))

(declare-datatypes ((Unit!13416 0))(
  ( (Unit!13417) )
))
(declare-fun lt!208895 () Unit!13416)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!790 (array!28614 array!28616 (_ BitVec 32) (_ BitVec 32) V!17651 V!17651 (_ BitVec 32) (_ BitVec 64) V!17651 (_ BitVec 32) Int) Unit!13416)

(assert (=> b!461049 (= lt!208895 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!790 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!41214 res!275731) b!461048))

(assert (= (and b!461048 res!275736) b!461035))

(assert (= (and b!461035 res!275728) b!461043))

(assert (= (and b!461043 res!275732) b!461038))

(assert (= (and b!461038 res!275733) b!461044))

(assert (= (and b!461044 res!275737) b!461039))

(assert (= (and b!461039 res!275740) b!461036))

(assert (= (and b!461036 res!275727) b!461041))

(assert (= (and b!461041 res!275735) b!461042))

(assert (= (and b!461042 res!275730) b!461040))

(assert (= (and b!461040 res!275729) b!461046))

(assert (= (and b!461046 res!275738) b!461045))

(assert (= (and b!461045 res!275734) b!461049))

(assert (= (and b!461049 (not res!275739)) b!461047))

(assert (= (and b!461033 condMapEmpty!20266) mapIsEmpty!20266))

(assert (= (and b!461033 (not condMapEmpty!20266)) mapNonEmpty!20266))

(get-info :version)

(assert (= (and mapNonEmpty!20266 ((_ is ValueCellFull!5861) mapValue!20266)) b!461037))

(assert (= (and b!461033 ((_ is ValueCellFull!5861) mapDefault!20266)) b!461034))

(assert (= start!41214 b!461033))

(declare-fun m!444497 () Bool)

(assert (=> start!41214 m!444497))

(declare-fun m!444499 () Bool)

(assert (=> start!41214 m!444499))

(declare-fun m!444501 () Bool)

(assert (=> b!461048 m!444501))

(declare-fun m!444503 () Bool)

(assert (=> b!461038 m!444503))

(declare-fun m!444505 () Bool)

(assert (=> b!461040 m!444505))

(declare-fun m!444507 () Bool)

(assert (=> b!461045 m!444507))

(declare-fun m!444509 () Bool)

(assert (=> b!461045 m!444509))

(declare-fun m!444511 () Bool)

(assert (=> b!461045 m!444511))

(declare-fun m!444513 () Bool)

(assert (=> b!461041 m!444513))

(declare-fun m!444515 () Bool)

(assert (=> b!461036 m!444515))

(declare-fun m!444517 () Bool)

(assert (=> b!461042 m!444517))

(declare-fun m!444519 () Bool)

(assert (=> b!461042 m!444519))

(declare-fun m!444521 () Bool)

(assert (=> b!461043 m!444521))

(declare-fun m!444523 () Bool)

(assert (=> mapNonEmpty!20266 m!444523))

(declare-fun m!444525 () Bool)

(assert (=> b!461039 m!444525))

(declare-fun m!444527 () Bool)

(assert (=> b!461049 m!444527))

(declare-fun m!444529 () Bool)

(assert (=> b!461049 m!444529))

(assert (=> b!461049 m!444529))

(declare-fun m!444531 () Bool)

(assert (=> b!461049 m!444531))

(declare-fun m!444533 () Bool)

(assert (=> b!461049 m!444533))

(declare-fun m!444535 () Bool)

(assert (=> b!461049 m!444535))

(assert (=> b!461049 m!444527))

(declare-fun m!444537 () Bool)

(assert (=> b!461049 m!444537))

(check-sat (not b!461049) tp_is_empty!12409 (not b!461039) (not b!461041) (not start!41214) b_and!19401 (not b!461048) (not b!461042) (not mapNonEmpty!20266) (not b!461045) (not b_next!11071) (not b!461038) (not b!461043) (not b!461040))
(check-sat b_and!19401 (not b_next!11071))
