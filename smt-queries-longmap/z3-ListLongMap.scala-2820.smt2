; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40870 () Bool)

(assert start!40870)

(declare-fun b_free!10819 () Bool)

(declare-fun b_next!10819 () Bool)

(assert (=> start!40870 (= b_free!10819 (not b_next!10819))))

(declare-fun tp!38283 () Bool)

(declare-fun b_and!18971 () Bool)

(assert (=> start!40870 (= tp!38283 b_and!18971)))

(declare-fun b!453991 () Bool)

(declare-fun e!265689 () Bool)

(declare-fun tp_is_empty!12157 () Bool)

(assert (=> b!453991 (= e!265689 tp_is_empty!12157)))

(declare-fun b!453992 () Bool)

(declare-fun res!270451 () Bool)

(declare-fun e!265687 () Bool)

(assert (=> b!453992 (=> (not res!270451) (not e!265687))))

(declare-datatypes ((array!28112 0))(
  ( (array!28113 (arr!13499 (Array (_ BitVec 32) (_ BitVec 64))) (size!13851 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28112)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28112 (_ BitVec 32)) Bool)

(assert (=> b!453992 (= res!270451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!453993 () Bool)

(declare-fun res!270457 () Bool)

(declare-fun e!265688 () Bool)

(assert (=> b!453993 (=> (not res!270457) (not e!265688))))

(declare-fun lt!206070 () array!28112)

(declare-datatypes ((List!8038 0))(
  ( (Nil!8035) (Cons!8034 (h!8890 (_ BitVec 64)) (t!13858 List!8038)) )
))
(declare-fun arrayNoDuplicates!0 (array!28112 (_ BitVec 32) List!8038) Bool)

(assert (=> b!453993 (= res!270457 (arrayNoDuplicates!0 lt!206070 #b00000000000000000000000000000000 Nil!8035))))

(declare-fun b!453995 () Bool)

(declare-fun res!270452 () Bool)

(assert (=> b!453995 (=> (not res!270452) (not e!265687))))

(assert (=> b!453995 (= res!270452 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8035))))

(declare-fun b!453996 () Bool)

(assert (=> b!453996 (= e!265688 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17315 0))(
  ( (V!17316 (val!6123 Int)) )
))
(declare-fun minValue!515 () V!17315)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5735 0))(
  ( (ValueCellFull!5735 (v!8390 V!17315)) (EmptyCell!5735) )
))
(declare-datatypes ((array!28114 0))(
  ( (array!28115 (arr!13500 (Array (_ BitVec 32) ValueCell!5735)) (size!13852 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28114)

(declare-fun zeroValue!515 () V!17315)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17315)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7970 0))(
  ( (tuple2!7971 (_1!3996 (_ BitVec 64)) (_2!3996 V!17315)) )
))
(declare-datatypes ((List!8039 0))(
  ( (Nil!8036) (Cons!8035 (h!8891 tuple2!7970) (t!13859 List!8039)) )
))
(declare-datatypes ((ListLongMap!6885 0))(
  ( (ListLongMap!6886 (toList!3458 List!8039)) )
))
(declare-fun lt!206072 () ListLongMap!6885)

(declare-fun getCurrentListMapNoExtraKeys!1687 (array!28112 array!28114 (_ BitVec 32) (_ BitVec 32) V!17315 V!17315 (_ BitVec 32) Int) ListLongMap!6885)

(assert (=> b!453996 (= lt!206072 (getCurrentListMapNoExtraKeys!1687 lt!206070 (array!28115 (store (arr!13500 _values!549) i!563 (ValueCellFull!5735 v!412)) (size!13852 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206071 () ListLongMap!6885)

(assert (=> b!453996 (= lt!206071 (getCurrentListMapNoExtraKeys!1687 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453997 () Bool)

(declare-fun res!270454 () Bool)

(assert (=> b!453997 (=> (not res!270454) (not e!265687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453997 (= res!270454 (validMask!0 mask!1025))))

(declare-fun b!453998 () Bool)

(assert (=> b!453998 (= e!265687 e!265688)))

(declare-fun res!270456 () Bool)

(assert (=> b!453998 (=> (not res!270456) (not e!265688))))

(assert (=> b!453998 (= res!270456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206070 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!453998 (= lt!206070 (array!28113 (store (arr!13499 _keys!709) i!563 k0!794) (size!13851 _keys!709)))))

(declare-fun b!453999 () Bool)

(declare-fun res!270458 () Bool)

(assert (=> b!453999 (=> (not res!270458) (not e!265687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453999 (= res!270458 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19876 () Bool)

(declare-fun mapRes!19876 () Bool)

(declare-fun tp!38284 () Bool)

(assert (=> mapNonEmpty!19876 (= mapRes!19876 (and tp!38284 e!265689))))

(declare-fun mapKey!19876 () (_ BitVec 32))

(declare-fun mapRest!19876 () (Array (_ BitVec 32) ValueCell!5735))

(declare-fun mapValue!19876 () ValueCell!5735)

(assert (=> mapNonEmpty!19876 (= (arr!13500 _values!549) (store mapRest!19876 mapKey!19876 mapValue!19876))))

(declare-fun b!454000 () Bool)

(declare-fun e!265685 () Bool)

(assert (=> b!454000 (= e!265685 tp_is_empty!12157)))

(declare-fun mapIsEmpty!19876 () Bool)

(assert (=> mapIsEmpty!19876 mapRes!19876))

(declare-fun b!454001 () Bool)

(declare-fun res!270453 () Bool)

(assert (=> b!454001 (=> (not res!270453) (not e!265687))))

(assert (=> b!454001 (= res!270453 (or (= (select (arr!13499 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13499 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454002 () Bool)

(declare-fun res!270455 () Bool)

(assert (=> b!454002 (=> (not res!270455) (not e!265688))))

(assert (=> b!454002 (= res!270455 (bvsle from!863 i!563))))

(declare-fun b!454003 () Bool)

(declare-fun res!270450 () Bool)

(assert (=> b!454003 (=> (not res!270450) (not e!265687))))

(assert (=> b!454003 (= res!270450 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13851 _keys!709))))))

(declare-fun b!453994 () Bool)

(declare-fun e!265686 () Bool)

(assert (=> b!453994 (= e!265686 (and e!265685 mapRes!19876))))

(declare-fun condMapEmpty!19876 () Bool)

(declare-fun mapDefault!19876 () ValueCell!5735)

(assert (=> b!453994 (= condMapEmpty!19876 (= (arr!13500 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5735)) mapDefault!19876)))))

(declare-fun res!270460 () Bool)

(assert (=> start!40870 (=> (not res!270460) (not e!265687))))

(assert (=> start!40870 (= res!270460 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13851 _keys!709))))))

(assert (=> start!40870 e!265687))

(assert (=> start!40870 tp_is_empty!12157))

(assert (=> start!40870 tp!38283))

(assert (=> start!40870 true))

(declare-fun array_inv!9858 (array!28114) Bool)

(assert (=> start!40870 (and (array_inv!9858 _values!549) e!265686)))

(declare-fun array_inv!9859 (array!28112) Bool)

(assert (=> start!40870 (array_inv!9859 _keys!709)))

(declare-fun b!454004 () Bool)

(declare-fun res!270459 () Bool)

(assert (=> b!454004 (=> (not res!270459) (not e!265687))))

(declare-fun arrayContainsKey!0 (array!28112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454004 (= res!270459 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454005 () Bool)

(declare-fun res!270449 () Bool)

(assert (=> b!454005 (=> (not res!270449) (not e!265687))))

(assert (=> b!454005 (= res!270449 (and (= (size!13852 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13851 _keys!709) (size!13852 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40870 res!270460) b!453997))

(assert (= (and b!453997 res!270454) b!454005))

(assert (= (and b!454005 res!270449) b!453992))

(assert (= (and b!453992 res!270451) b!453995))

(assert (= (and b!453995 res!270452) b!454003))

(assert (= (and b!454003 res!270450) b!453999))

(assert (= (and b!453999 res!270458) b!454001))

(assert (= (and b!454001 res!270453) b!454004))

(assert (= (and b!454004 res!270459) b!453998))

(assert (= (and b!453998 res!270456) b!453993))

(assert (= (and b!453993 res!270457) b!454002))

(assert (= (and b!454002 res!270455) b!453996))

(assert (= (and b!453994 condMapEmpty!19876) mapIsEmpty!19876))

(assert (= (and b!453994 (not condMapEmpty!19876)) mapNonEmpty!19876))

(get-info :version)

(assert (= (and mapNonEmpty!19876 ((_ is ValueCellFull!5735) mapValue!19876)) b!453991))

(assert (= (and b!453994 ((_ is ValueCellFull!5735) mapDefault!19876)) b!454000))

(assert (= start!40870 b!453994))

(declare-fun m!438483 () Bool)

(assert (=> b!454004 m!438483))

(declare-fun m!438485 () Bool)

(assert (=> b!453995 m!438485))

(declare-fun m!438487 () Bool)

(assert (=> start!40870 m!438487))

(declare-fun m!438489 () Bool)

(assert (=> start!40870 m!438489))

(declare-fun m!438491 () Bool)

(assert (=> b!453996 m!438491))

(declare-fun m!438493 () Bool)

(assert (=> b!453996 m!438493))

(declare-fun m!438495 () Bool)

(assert (=> b!453996 m!438495))

(declare-fun m!438497 () Bool)

(assert (=> b!453992 m!438497))

(declare-fun m!438499 () Bool)

(assert (=> b!454001 m!438499))

(declare-fun m!438501 () Bool)

(assert (=> b!453998 m!438501))

(declare-fun m!438503 () Bool)

(assert (=> b!453998 m!438503))

(declare-fun m!438505 () Bool)

(assert (=> b!453993 m!438505))

(declare-fun m!438507 () Bool)

(assert (=> b!453999 m!438507))

(declare-fun m!438509 () Bool)

(assert (=> b!453997 m!438509))

(declare-fun m!438511 () Bool)

(assert (=> mapNonEmpty!19876 m!438511))

(check-sat (not mapNonEmpty!19876) (not b!453992) (not b!454004) (not b!453996) (not b!453999) (not b!453997) (not b!453998) (not start!40870) (not b_next!10819) tp_is_empty!12157 b_and!18971 (not b!453993) (not b!453995))
(check-sat b_and!18971 (not b_next!10819))
