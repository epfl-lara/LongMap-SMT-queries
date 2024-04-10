; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39672 () Bool)

(assert start!39672)

(declare-fun b_free!9939 () Bool)

(declare-fun b_next!9939 () Bool)

(assert (=> start!39672 (= b_free!9939 (not b_next!9939))))

(declare-fun tp!35346 () Bool)

(declare-fun b_and!17595 () Bool)

(assert (=> start!39672 (= tp!35346 b_and!17595)))

(declare-fun b!425951 () Bool)

(declare-fun res!249503 () Bool)

(declare-fun e!252791 () Bool)

(assert (=> b!425951 (=> (not res!249503) (not e!252791))))

(declare-datatypes ((array!26021 0))(
  ( (array!26022 (arr!12460 (Array (_ BitVec 32) (_ BitVec 64))) (size!12812 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26021)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425951 (= res!249503 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425952 () Bool)

(declare-fun res!249501 () Bool)

(assert (=> b!425952 (=> (not res!249501) (not e!252791))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425952 (= res!249501 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12812 _keys!709))))))

(declare-fun b!425953 () Bool)

(declare-fun e!252786 () Bool)

(declare-fun tp_is_empty!11091 () Bool)

(assert (=> b!425953 (= e!252786 tp_is_empty!11091)))

(declare-fun b!425954 () Bool)

(declare-fun res!249506 () Bool)

(assert (=> b!425954 (=> (not res!249506) (not e!252791))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425954 (= res!249506 (validMask!0 mask!1025))))

(declare-fun b!425956 () Bool)

(declare-fun e!252790 () Bool)

(declare-fun e!252787 () Bool)

(assert (=> b!425956 (= e!252790 e!252787)))

(declare-fun res!249511 () Bool)

(assert (=> b!425956 (=> (not res!249511) (not e!252787))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425956 (= res!249511 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15893 0))(
  ( (V!15894 (val!5590 Int)) )
))
(declare-fun minValue!515 () V!15893)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5202 0))(
  ( (ValueCellFull!5202 (v!7837 V!15893)) (EmptyCell!5202) )
))
(declare-datatypes ((array!26023 0))(
  ( (array!26024 (arr!12461 (Array (_ BitVec 32) ValueCell!5202)) (size!12813 (_ BitVec 32))) )
))
(declare-fun lt!194811 () array!26023)

(declare-fun zeroValue!515 () V!15893)

(declare-datatypes ((tuple2!7344 0))(
  ( (tuple2!7345 (_1!3683 (_ BitVec 64)) (_2!3683 V!15893)) )
))
(declare-datatypes ((List!7356 0))(
  ( (Nil!7353) (Cons!7352 (h!8208 tuple2!7344) (t!12800 List!7356)) )
))
(declare-datatypes ((ListLongMap!6257 0))(
  ( (ListLongMap!6258 (toList!3144 List!7356)) )
))
(declare-fun lt!194813 () ListLongMap!6257)

(declare-fun lt!194809 () array!26021)

(declare-fun getCurrentListMapNoExtraKeys!1348 (array!26021 array!26023 (_ BitVec 32) (_ BitVec 32) V!15893 V!15893 (_ BitVec 32) Int) ListLongMap!6257)

(assert (=> b!425956 (= lt!194813 (getCurrentListMapNoExtraKeys!1348 lt!194809 lt!194811 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26023)

(declare-fun v!412 () V!15893)

(assert (=> b!425956 (= lt!194811 (array!26024 (store (arr!12461 _values!549) i!563 (ValueCellFull!5202 v!412)) (size!12813 _values!549)))))

(declare-fun lt!194810 () ListLongMap!6257)

(assert (=> b!425956 (= lt!194810 (getCurrentListMapNoExtraKeys!1348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425957 () Bool)

(declare-fun res!249509 () Bool)

(assert (=> b!425957 (=> (not res!249509) (not e!252791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425957 (= res!249509 (validKeyInArray!0 k0!794))))

(declare-fun b!425958 () Bool)

(assert (=> b!425958 (= e!252787 (not true))))

(declare-fun +!1302 (ListLongMap!6257 tuple2!7344) ListLongMap!6257)

(assert (=> b!425958 (= (getCurrentListMapNoExtraKeys!1348 lt!194809 lt!194811 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1302 (getCurrentListMapNoExtraKeys!1348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7345 k0!794 v!412)))))

(declare-datatypes ((Unit!12506 0))(
  ( (Unit!12507) )
))
(declare-fun lt!194812 () Unit!12506)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!497 (array!26021 array!26023 (_ BitVec 32) (_ BitVec 32) V!15893 V!15893 (_ BitVec 32) (_ BitVec 64) V!15893 (_ BitVec 32) Int) Unit!12506)

(assert (=> b!425958 (= lt!194812 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425959 () Bool)

(declare-fun e!252792 () Bool)

(assert (=> b!425959 (= e!252792 tp_is_empty!11091)))

(declare-fun b!425960 () Bool)

(declare-fun e!252789 () Bool)

(declare-fun mapRes!18258 () Bool)

(assert (=> b!425960 (= e!252789 (and e!252792 mapRes!18258))))

(declare-fun condMapEmpty!18258 () Bool)

(declare-fun mapDefault!18258 () ValueCell!5202)

(assert (=> b!425960 (= condMapEmpty!18258 (= (arr!12461 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5202)) mapDefault!18258)))))

(declare-fun b!425961 () Bool)

(declare-fun res!249507 () Bool)

(assert (=> b!425961 (=> (not res!249507) (not e!252791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26021 (_ BitVec 32)) Bool)

(assert (=> b!425961 (= res!249507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425962 () Bool)

(assert (=> b!425962 (= e!252791 e!252790)))

(declare-fun res!249504 () Bool)

(assert (=> b!425962 (=> (not res!249504) (not e!252790))))

(assert (=> b!425962 (= res!249504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194809 mask!1025))))

(assert (=> b!425962 (= lt!194809 (array!26022 (store (arr!12460 _keys!709) i!563 k0!794) (size!12812 _keys!709)))))

(declare-fun b!425963 () Bool)

(declare-fun res!249510 () Bool)

(assert (=> b!425963 (=> (not res!249510) (not e!252790))))

(assert (=> b!425963 (= res!249510 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18258 () Bool)

(assert (=> mapIsEmpty!18258 mapRes!18258))

(declare-fun b!425964 () Bool)

(declare-fun res!249505 () Bool)

(assert (=> b!425964 (=> (not res!249505) (not e!252790))))

(declare-datatypes ((List!7357 0))(
  ( (Nil!7354) (Cons!7353 (h!8209 (_ BitVec 64)) (t!12801 List!7357)) )
))
(declare-fun arrayNoDuplicates!0 (array!26021 (_ BitVec 32) List!7357) Bool)

(assert (=> b!425964 (= res!249505 (arrayNoDuplicates!0 lt!194809 #b00000000000000000000000000000000 Nil!7354))))

(declare-fun b!425965 () Bool)

(declare-fun res!249513 () Bool)

(assert (=> b!425965 (=> (not res!249513) (not e!252791))))

(assert (=> b!425965 (= res!249513 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7354))))

(declare-fun res!249502 () Bool)

(assert (=> start!39672 (=> (not res!249502) (not e!252791))))

(assert (=> start!39672 (= res!249502 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12812 _keys!709))))))

(assert (=> start!39672 e!252791))

(assert (=> start!39672 tp_is_empty!11091))

(assert (=> start!39672 tp!35346))

(assert (=> start!39672 true))

(declare-fun array_inv!9082 (array!26023) Bool)

(assert (=> start!39672 (and (array_inv!9082 _values!549) e!252789)))

(declare-fun array_inv!9083 (array!26021) Bool)

(assert (=> start!39672 (array_inv!9083 _keys!709)))

(declare-fun b!425955 () Bool)

(declare-fun res!249512 () Bool)

(assert (=> b!425955 (=> (not res!249512) (not e!252791))))

(assert (=> b!425955 (= res!249512 (or (= (select (arr!12460 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12460 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18258 () Bool)

(declare-fun tp!35345 () Bool)

(assert (=> mapNonEmpty!18258 (= mapRes!18258 (and tp!35345 e!252786))))

(declare-fun mapRest!18258 () (Array (_ BitVec 32) ValueCell!5202))

(declare-fun mapValue!18258 () ValueCell!5202)

(declare-fun mapKey!18258 () (_ BitVec 32))

(assert (=> mapNonEmpty!18258 (= (arr!12461 _values!549) (store mapRest!18258 mapKey!18258 mapValue!18258))))

(declare-fun b!425966 () Bool)

(declare-fun res!249508 () Bool)

(assert (=> b!425966 (=> (not res!249508) (not e!252791))))

(assert (=> b!425966 (= res!249508 (and (= (size!12813 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12812 _keys!709) (size!12813 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39672 res!249502) b!425954))

(assert (= (and b!425954 res!249506) b!425966))

(assert (= (and b!425966 res!249508) b!425961))

(assert (= (and b!425961 res!249507) b!425965))

(assert (= (and b!425965 res!249513) b!425952))

(assert (= (and b!425952 res!249501) b!425957))

(assert (= (and b!425957 res!249509) b!425955))

(assert (= (and b!425955 res!249512) b!425951))

(assert (= (and b!425951 res!249503) b!425962))

(assert (= (and b!425962 res!249504) b!425964))

(assert (= (and b!425964 res!249505) b!425963))

(assert (= (and b!425963 res!249510) b!425956))

(assert (= (and b!425956 res!249511) b!425958))

(assert (= (and b!425960 condMapEmpty!18258) mapIsEmpty!18258))

(assert (= (and b!425960 (not condMapEmpty!18258)) mapNonEmpty!18258))

(get-info :version)

(assert (= (and mapNonEmpty!18258 ((_ is ValueCellFull!5202) mapValue!18258)) b!425953))

(assert (= (and b!425960 ((_ is ValueCellFull!5202) mapDefault!18258)) b!425959))

(assert (= start!39672 b!425960))

(declare-fun m!414743 () Bool)

(assert (=> b!425958 m!414743))

(declare-fun m!414745 () Bool)

(assert (=> b!425958 m!414745))

(assert (=> b!425958 m!414745))

(declare-fun m!414747 () Bool)

(assert (=> b!425958 m!414747))

(declare-fun m!414749 () Bool)

(assert (=> b!425958 m!414749))

(declare-fun m!414751 () Bool)

(assert (=> b!425962 m!414751))

(declare-fun m!414753 () Bool)

(assert (=> b!425962 m!414753))

(declare-fun m!414755 () Bool)

(assert (=> b!425956 m!414755))

(declare-fun m!414757 () Bool)

(assert (=> b!425956 m!414757))

(declare-fun m!414759 () Bool)

(assert (=> b!425956 m!414759))

(declare-fun m!414761 () Bool)

(assert (=> mapNonEmpty!18258 m!414761))

(declare-fun m!414763 () Bool)

(assert (=> b!425964 m!414763))

(declare-fun m!414765 () Bool)

(assert (=> b!425955 m!414765))

(declare-fun m!414767 () Bool)

(assert (=> b!425957 m!414767))

(declare-fun m!414769 () Bool)

(assert (=> b!425961 m!414769))

(declare-fun m!414771 () Bool)

(assert (=> b!425951 m!414771))

(declare-fun m!414773 () Bool)

(assert (=> b!425965 m!414773))

(declare-fun m!414775 () Bool)

(assert (=> b!425954 m!414775))

(declare-fun m!414777 () Bool)

(assert (=> start!39672 m!414777))

(declare-fun m!414779 () Bool)

(assert (=> start!39672 m!414779))

(check-sat (not mapNonEmpty!18258) b_and!17595 (not b!425954) tp_is_empty!11091 (not b!425961) (not b!425962) (not b!425964) (not b!425956) (not b!425958) (not b!425965) (not b_next!9939) (not b!425957) (not b!425951) (not start!39672))
(check-sat b_and!17595 (not b_next!9939))
