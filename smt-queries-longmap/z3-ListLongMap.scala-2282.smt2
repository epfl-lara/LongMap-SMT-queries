; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37140 () Bool)

(assert start!37140)

(declare-fun b_free!8281 () Bool)

(declare-fun b_next!8281 () Bool)

(assert (=> start!37140 (= b_free!8281 (not b_next!8281))))

(declare-fun tp!29558 () Bool)

(declare-fun b_and!15537 () Bool)

(assert (=> start!37140 (= tp!29558 b_and!15537)))

(declare-fun b!374708 () Bool)

(declare-fun res!211399 () Bool)

(declare-fun e!228337 () Bool)

(assert (=> b!374708 (=> (not res!211399) (not e!228337))))

(declare-datatypes ((array!21778 0))(
  ( (array!21779 (arr!10357 (Array (_ BitVec 32) (_ BitVec 64))) (size!10709 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21778)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374708 (= res!211399 (or (= (select (arr!10357 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10357 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14958 () Bool)

(declare-fun mapRes!14958 () Bool)

(declare-fun tp!29559 () Bool)

(declare-fun e!228341 () Bool)

(assert (=> mapNonEmpty!14958 (= mapRes!14958 (and tp!29559 e!228341))))

(declare-datatypes ((V!13011 0))(
  ( (V!13012 (val!4509 Int)) )
))
(declare-datatypes ((ValueCell!4121 0))(
  ( (ValueCellFull!4121 (v!6707 V!13011)) (EmptyCell!4121) )
))
(declare-datatypes ((array!21780 0))(
  ( (array!21781 (arr!10358 (Array (_ BitVec 32) ValueCell!4121)) (size!10710 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21780)

(declare-fun mapRest!14958 () (Array (_ BitVec 32) ValueCell!4121))

(declare-fun mapKey!14958 () (_ BitVec 32))

(declare-fun mapValue!14958 () ValueCell!4121)

(assert (=> mapNonEmpty!14958 (= (arr!10358 _values!506) (store mapRest!14958 mapKey!14958 mapValue!14958))))

(declare-fun b!374709 () Bool)

(declare-fun e!228338 () Bool)

(declare-fun e!228342 () Bool)

(assert (=> b!374709 (= e!228338 (not e!228342))))

(declare-fun res!211396 () Bool)

(assert (=> b!374709 (=> res!211396 e!228342)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374709 (= res!211396 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5902 0))(
  ( (tuple2!5903 (_1!2962 (_ BitVec 64)) (_2!2962 V!13011)) )
))
(declare-datatypes ((List!5745 0))(
  ( (Nil!5742) (Cons!5741 (h!6597 tuple2!5902) (t!10887 List!5745)) )
))
(declare-datatypes ((ListLongMap!4817 0))(
  ( (ListLongMap!4818 (toList!2424 List!5745)) )
))
(declare-fun lt!172999 () ListLongMap!4817)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13011)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13011)

(declare-fun getCurrentListMap!1881 (array!21778 array!21780 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) Int) ListLongMap!4817)

(assert (=> b!374709 (= lt!172999 (getCurrentListMap!1881 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173004 () ListLongMap!4817)

(declare-fun lt!173000 () array!21780)

(declare-fun lt!172996 () array!21778)

(assert (=> b!374709 (= lt!173004 (getCurrentListMap!1881 lt!172996 lt!173000 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173002 () ListLongMap!4817)

(declare-fun lt!173003 () ListLongMap!4817)

(assert (=> b!374709 (and (= lt!173002 lt!173003) (= lt!173003 lt!173002))))

(declare-fun lt!172993 () ListLongMap!4817)

(declare-fun lt!173005 () tuple2!5902)

(declare-fun +!820 (ListLongMap!4817 tuple2!5902) ListLongMap!4817)

(assert (=> b!374709 (= lt!173003 (+!820 lt!172993 lt!173005))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13011)

(assert (=> b!374709 (= lt!173005 (tuple2!5903 k0!778 v!373))))

(declare-datatypes ((Unit!11529 0))(
  ( (Unit!11530) )
))
(declare-fun lt!172997 () Unit!11529)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!68 (array!21778 array!21780 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) (_ BitVec 64) V!13011 (_ BitVec 32) Int) Unit!11529)

(assert (=> b!374709 (= lt!172997 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!68 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!728 (array!21778 array!21780 (_ BitVec 32) (_ BitVec 32) V!13011 V!13011 (_ BitVec 32) Int) ListLongMap!4817)

(assert (=> b!374709 (= lt!173002 (getCurrentListMapNoExtraKeys!728 lt!172996 lt!173000 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374709 (= lt!173000 (array!21781 (store (arr!10358 _values!506) i!548 (ValueCellFull!4121 v!373)) (size!10710 _values!506)))))

(assert (=> b!374709 (= lt!172993 (getCurrentListMapNoExtraKeys!728 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374710 () Bool)

(declare-fun e!228339 () Bool)

(declare-fun tp_is_empty!8929 () Bool)

(assert (=> b!374710 (= e!228339 tp_is_empty!8929)))

(declare-fun b!374711 () Bool)

(assert (=> b!374711 (= e!228341 tp_is_empty!8929)))

(declare-fun b!374712 () Bool)

(declare-fun res!211395 () Bool)

(assert (=> b!374712 (=> (not res!211395) (not e!228337))))

(declare-datatypes ((List!5746 0))(
  ( (Nil!5743) (Cons!5742 (h!6598 (_ BitVec 64)) (t!10888 List!5746)) )
))
(declare-fun arrayNoDuplicates!0 (array!21778 (_ BitVec 32) List!5746) Bool)

(assert (=> b!374712 (= res!211395 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5743))))

(declare-fun b!374713 () Bool)

(declare-fun res!211400 () Bool)

(assert (=> b!374713 (=> (not res!211400) (not e!228337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374713 (= res!211400 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14958 () Bool)

(assert (=> mapIsEmpty!14958 mapRes!14958))

(declare-fun b!374714 () Bool)

(declare-fun res!211401 () Bool)

(assert (=> b!374714 (=> (not res!211401) (not e!228337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21778 (_ BitVec 32)) Bool)

(assert (=> b!374714 (= res!211401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374715 () Bool)

(declare-fun e!228336 () Bool)

(assert (=> b!374715 (= e!228342 e!228336)))

(declare-fun res!211398 () Bool)

(assert (=> b!374715 (=> res!211398 e!228336)))

(assert (=> b!374715 (= res!211398 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!172994 () ListLongMap!4817)

(declare-fun lt!172992 () ListLongMap!4817)

(assert (=> b!374715 (= lt!172994 lt!172992)))

(declare-fun lt!173001 () ListLongMap!4817)

(assert (=> b!374715 (= lt!172992 (+!820 lt!173001 lt!173005))))

(declare-fun lt!172995 () Unit!11529)

(declare-fun addCommutativeForDiffKeys!248 (ListLongMap!4817 (_ BitVec 64) V!13011 (_ BitVec 64) V!13011) Unit!11529)

(assert (=> b!374715 (= lt!172995 (addCommutativeForDiffKeys!248 lt!172993 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!172998 () tuple2!5902)

(assert (=> b!374715 (= lt!173004 (+!820 lt!172994 lt!172998))))

(declare-fun lt!172990 () tuple2!5902)

(assert (=> b!374715 (= lt!172994 (+!820 lt!173003 lt!172990))))

(declare-fun lt!172991 () ListLongMap!4817)

(assert (=> b!374715 (= lt!172999 lt!172991)))

(assert (=> b!374715 (= lt!172991 (+!820 lt!173001 lt!172998))))

(assert (=> b!374715 (= lt!173001 (+!820 lt!172993 lt!172990))))

(assert (=> b!374715 (= lt!173004 (+!820 (+!820 lt!173002 lt!172990) lt!172998))))

(assert (=> b!374715 (= lt!172998 (tuple2!5903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374715 (= lt!172990 (tuple2!5903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374716 () Bool)

(declare-fun res!211397 () Bool)

(assert (=> b!374716 (=> (not res!211397) (not e!228337))))

(assert (=> b!374716 (= res!211397 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10709 _keys!658))))))

(declare-fun res!211405 () Bool)

(assert (=> start!37140 (=> (not res!211405) (not e!228337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37140 (= res!211405 (validMask!0 mask!970))))

(assert (=> start!37140 e!228337))

(declare-fun e!228335 () Bool)

(declare-fun array_inv!7688 (array!21780) Bool)

(assert (=> start!37140 (and (array_inv!7688 _values!506) e!228335)))

(assert (=> start!37140 tp!29558))

(assert (=> start!37140 true))

(assert (=> start!37140 tp_is_empty!8929))

(declare-fun array_inv!7689 (array!21778) Bool)

(assert (=> start!37140 (array_inv!7689 _keys!658)))

(declare-fun b!374717 () Bool)

(declare-fun res!211402 () Bool)

(assert (=> b!374717 (=> (not res!211402) (not e!228338))))

(assert (=> b!374717 (= res!211402 (arrayNoDuplicates!0 lt!172996 #b00000000000000000000000000000000 Nil!5743))))

(declare-fun b!374718 () Bool)

(assert (=> b!374718 (= e!228335 (and e!228339 mapRes!14958))))

(declare-fun condMapEmpty!14958 () Bool)

(declare-fun mapDefault!14958 () ValueCell!4121)

(assert (=> b!374718 (= condMapEmpty!14958 (= (arr!10358 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4121)) mapDefault!14958)))))

(declare-fun b!374719 () Bool)

(declare-fun res!211406 () Bool)

(assert (=> b!374719 (=> (not res!211406) (not e!228337))))

(declare-fun arrayContainsKey!0 (array!21778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374719 (= res!211406 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374720 () Bool)

(declare-fun res!211403 () Bool)

(assert (=> b!374720 (=> (not res!211403) (not e!228337))))

(assert (=> b!374720 (= res!211403 (and (= (size!10710 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10709 _keys!658) (size!10710 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374721 () Bool)

(assert (=> b!374721 (= e!228336 true)))

(assert (=> b!374721 (= (+!820 lt!172992 lt!172998) (+!820 lt!172991 lt!173005))))

(declare-fun lt!172989 () Unit!11529)

(assert (=> b!374721 (= lt!172989 (addCommutativeForDiffKeys!248 lt!173001 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!374722 () Bool)

(assert (=> b!374722 (= e!228337 e!228338)))

(declare-fun res!211404 () Bool)

(assert (=> b!374722 (=> (not res!211404) (not e!228338))))

(assert (=> b!374722 (= res!211404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!172996 mask!970))))

(assert (=> b!374722 (= lt!172996 (array!21779 (store (arr!10357 _keys!658) i!548 k0!778) (size!10709 _keys!658)))))

(assert (= (and start!37140 res!211405) b!374720))

(assert (= (and b!374720 res!211403) b!374714))

(assert (= (and b!374714 res!211401) b!374712))

(assert (= (and b!374712 res!211395) b!374716))

(assert (= (and b!374716 res!211397) b!374713))

(assert (= (and b!374713 res!211400) b!374708))

(assert (= (and b!374708 res!211399) b!374719))

(assert (= (and b!374719 res!211406) b!374722))

(assert (= (and b!374722 res!211404) b!374717))

(assert (= (and b!374717 res!211402) b!374709))

(assert (= (and b!374709 (not res!211396)) b!374715))

(assert (= (and b!374715 (not res!211398)) b!374721))

(assert (= (and b!374718 condMapEmpty!14958) mapIsEmpty!14958))

(assert (= (and b!374718 (not condMapEmpty!14958)) mapNonEmpty!14958))

(get-info :version)

(assert (= (and mapNonEmpty!14958 ((_ is ValueCellFull!4121) mapValue!14958)) b!374711))

(assert (= (and b!374718 ((_ is ValueCellFull!4121) mapDefault!14958)) b!374710))

(assert (= start!37140 b!374718))

(declare-fun m!371345 () Bool)

(assert (=> b!374721 m!371345))

(declare-fun m!371347 () Bool)

(assert (=> b!374721 m!371347))

(declare-fun m!371349 () Bool)

(assert (=> b!374721 m!371349))

(declare-fun m!371351 () Bool)

(assert (=> b!374719 m!371351))

(declare-fun m!371353 () Bool)

(assert (=> b!374713 m!371353))

(declare-fun m!371355 () Bool)

(assert (=> b!374722 m!371355))

(declare-fun m!371357 () Bool)

(assert (=> b!374722 m!371357))

(declare-fun m!371359 () Bool)

(assert (=> b!374709 m!371359))

(declare-fun m!371361 () Bool)

(assert (=> b!374709 m!371361))

(declare-fun m!371363 () Bool)

(assert (=> b!374709 m!371363))

(declare-fun m!371365 () Bool)

(assert (=> b!374709 m!371365))

(declare-fun m!371367 () Bool)

(assert (=> b!374709 m!371367))

(declare-fun m!371369 () Bool)

(assert (=> b!374709 m!371369))

(declare-fun m!371371 () Bool)

(assert (=> b!374709 m!371371))

(declare-fun m!371373 () Bool)

(assert (=> start!37140 m!371373))

(declare-fun m!371375 () Bool)

(assert (=> start!37140 m!371375))

(declare-fun m!371377 () Bool)

(assert (=> start!37140 m!371377))

(declare-fun m!371379 () Bool)

(assert (=> mapNonEmpty!14958 m!371379))

(declare-fun m!371381 () Bool)

(assert (=> b!374708 m!371381))

(declare-fun m!371383 () Bool)

(assert (=> b!374714 m!371383))

(declare-fun m!371385 () Bool)

(assert (=> b!374715 m!371385))

(declare-fun m!371387 () Bool)

(assert (=> b!374715 m!371387))

(declare-fun m!371389 () Bool)

(assert (=> b!374715 m!371389))

(declare-fun m!371391 () Bool)

(assert (=> b!374715 m!371391))

(declare-fun m!371393 () Bool)

(assert (=> b!374715 m!371393))

(declare-fun m!371395 () Bool)

(assert (=> b!374715 m!371395))

(declare-fun m!371397 () Bool)

(assert (=> b!374715 m!371397))

(assert (=> b!374715 m!371393))

(declare-fun m!371399 () Bool)

(assert (=> b!374715 m!371399))

(declare-fun m!371401 () Bool)

(assert (=> b!374717 m!371401))

(declare-fun m!371403 () Bool)

(assert (=> b!374712 m!371403))

(check-sat tp_is_empty!8929 b_and!15537 (not b!374709) (not b!374713) (not mapNonEmpty!14958) (not b!374719) (not b!374721) (not b_next!8281) (not b!374717) (not b!374715) (not b!374722) (not b!374714) (not start!37140) (not b!374712))
(check-sat b_and!15537 (not b_next!8281))
