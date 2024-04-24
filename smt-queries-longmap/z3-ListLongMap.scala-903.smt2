; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20518 () Bool)

(assert start!20518)

(declare-fun b_free!5173 () Bool)

(declare-fun b_next!5173 () Bool)

(assert (=> start!20518 (= b_free!5173 (not b_next!5173))))

(declare-fun tp!18550 () Bool)

(declare-fun b_and!11933 () Bool)

(assert (=> start!20518 (= tp!18550 b_and!11933)))

(declare-fun res!98013 () Bool)

(declare-fun e!133393 () Bool)

(assert (=> start!20518 (=> (not res!98013) (not e!133393))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20518 (= res!98013 (validMask!0 mask!1149))))

(assert (=> start!20518 e!133393))

(declare-datatypes ((V!6353 0))(
  ( (V!6354 (val!2559 Int)) )
))
(declare-datatypes ((ValueCell!2171 0))(
  ( (ValueCellFull!2171 (v!4530 V!6353)) (EmptyCell!2171) )
))
(declare-datatypes ((array!9269 0))(
  ( (array!9270 (arr!4385 (Array (_ BitVec 32) ValueCell!2171)) (size!4710 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9269)

(declare-fun e!133394 () Bool)

(declare-fun array_inv!2865 (array!9269) Bool)

(assert (=> start!20518 (and (array_inv!2865 _values!649) e!133394)))

(assert (=> start!20518 true))

(declare-fun tp_is_empty!5029 () Bool)

(assert (=> start!20518 tp_is_empty!5029))

(declare-datatypes ((array!9271 0))(
  ( (array!9272 (arr!4386 (Array (_ BitVec 32) (_ BitVec 64))) (size!4711 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9271)

(declare-fun array_inv!2866 (array!9271) Bool)

(assert (=> start!20518 (array_inv!2866 _keys!825)))

(assert (=> start!20518 tp!18550))

(declare-fun b!203798 () Bool)

(declare-fun res!98014 () Bool)

(assert (=> b!203798 (=> (not res!98014) (not e!133393))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203798 (= res!98014 (= (select (arr!4386 _keys!825) i!601) k0!843))))

(declare-fun b!203799 () Bool)

(declare-fun e!133389 () Bool)

(declare-fun mapRes!8612 () Bool)

(assert (=> b!203799 (= e!133394 (and e!133389 mapRes!8612))))

(declare-fun condMapEmpty!8612 () Bool)

(declare-fun mapDefault!8612 () ValueCell!2171)

(assert (=> b!203799 (= condMapEmpty!8612 (= (arr!4385 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2171)) mapDefault!8612)))))

(declare-fun b!203800 () Bool)

(declare-fun res!98009 () Bool)

(assert (=> b!203800 (=> (not res!98009) (not e!133393))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203800 (= res!98009 (and (= (size!4710 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4711 _keys!825) (size!4710 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203801 () Bool)

(declare-fun res!98015 () Bool)

(assert (=> b!203801 (=> (not res!98015) (not e!133393))))

(declare-datatypes ((List!2721 0))(
  ( (Nil!2718) (Cons!2717 (h!3359 (_ BitVec 64)) (t!7644 List!2721)) )
))
(declare-fun arrayNoDuplicates!0 (array!9271 (_ BitVec 32) List!2721) Bool)

(assert (=> b!203801 (= res!98015 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2718))))

(declare-fun b!203802 () Bool)

(declare-fun e!133390 () Bool)

(declare-fun e!133388 () Bool)

(assert (=> b!203802 (= e!133390 e!133388)))

(declare-fun res!98017 () Bool)

(assert (=> b!203802 (=> res!98017 e!133388)))

(assert (=> b!203802 (= res!98017 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3822 0))(
  ( (tuple2!3823 (_1!1922 (_ BitVec 64)) (_2!1922 V!6353)) )
))
(declare-datatypes ((List!2722 0))(
  ( (Nil!2719) (Cons!2718 (h!3360 tuple2!3822) (t!7645 List!2722)) )
))
(declare-datatypes ((ListLongMap!2737 0))(
  ( (ListLongMap!2738 (toList!1384 List!2722)) )
))
(declare-fun lt!102987 () ListLongMap!2737)

(declare-fun lt!102991 () ListLongMap!2737)

(assert (=> b!203802 (= lt!102987 lt!102991)))

(declare-fun lt!102992 () ListLongMap!2737)

(declare-fun lt!102988 () tuple2!3822)

(declare-fun +!438 (ListLongMap!2737 tuple2!3822) ListLongMap!2737)

(assert (=> b!203802 (= lt!102991 (+!438 lt!102992 lt!102988))))

(declare-fun lt!102989 () ListLongMap!2737)

(declare-fun lt!102994 () ListLongMap!2737)

(assert (=> b!203802 (= lt!102989 lt!102994)))

(declare-fun lt!102996 () ListLongMap!2737)

(assert (=> b!203802 (= lt!102994 (+!438 lt!102996 lt!102988))))

(declare-fun lt!102990 () ListLongMap!2737)

(assert (=> b!203802 (= lt!102987 (+!438 lt!102990 lt!102988))))

(declare-fun zeroValue!615 () V!6353)

(assert (=> b!203802 (= lt!102988 (tuple2!3823 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203803 () Bool)

(assert (=> b!203803 (= e!133389 tp_is_empty!5029)))

(declare-fun mapIsEmpty!8612 () Bool)

(assert (=> mapIsEmpty!8612 mapRes!8612))

(declare-fun b!203804 () Bool)

(declare-fun res!98016 () Bool)

(assert (=> b!203804 (=> (not res!98016) (not e!133393))))

(assert (=> b!203804 (= res!98016 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4711 _keys!825))))))

(declare-fun b!203805 () Bool)

(declare-fun e!133391 () Bool)

(assert (=> b!203805 (= e!133391 tp_is_empty!5029)))

(declare-fun b!203806 () Bool)

(assert (=> b!203806 (= e!133393 (not e!133390))))

(declare-fun res!98011 () Bool)

(assert (=> b!203806 (=> res!98011 e!133390)))

(assert (=> b!203806 (= res!98011 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6353)

(declare-fun getCurrentListMap!962 (array!9271 array!9269 (_ BitVec 32) (_ BitVec 32) V!6353 V!6353 (_ BitVec 32) Int) ListLongMap!2737)

(assert (=> b!203806 (= lt!102989 (getCurrentListMap!962 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102995 () array!9269)

(assert (=> b!203806 (= lt!102987 (getCurrentListMap!962 _keys!825 lt!102995 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203806 (and (= lt!102990 lt!102992) (= lt!102992 lt!102990))))

(declare-fun lt!102998 () tuple2!3822)

(assert (=> b!203806 (= lt!102992 (+!438 lt!102996 lt!102998))))

(declare-fun v!520 () V!6353)

(assert (=> b!203806 (= lt!102998 (tuple2!3823 k0!843 v!520))))

(declare-datatypes ((Unit!6156 0))(
  ( (Unit!6157) )
))
(declare-fun lt!102993 () Unit!6156)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!98 (array!9271 array!9269 (_ BitVec 32) (_ BitVec 32) V!6353 V!6353 (_ BitVec 32) (_ BitVec 64) V!6353 (_ BitVec 32) Int) Unit!6156)

(assert (=> b!203806 (= lt!102993 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!98 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!355 (array!9271 array!9269 (_ BitVec 32) (_ BitVec 32) V!6353 V!6353 (_ BitVec 32) Int) ListLongMap!2737)

(assert (=> b!203806 (= lt!102990 (getCurrentListMapNoExtraKeys!355 _keys!825 lt!102995 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203806 (= lt!102995 (array!9270 (store (arr!4385 _values!649) i!601 (ValueCellFull!2171 v!520)) (size!4710 _values!649)))))

(assert (=> b!203806 (= lt!102996 (getCurrentListMapNoExtraKeys!355 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203807 () Bool)

(assert (=> b!203807 (= e!133388 true)))

(assert (=> b!203807 (= lt!102991 (+!438 lt!102994 lt!102998))))

(declare-fun lt!102997 () Unit!6156)

(declare-fun addCommutativeForDiffKeys!152 (ListLongMap!2737 (_ BitVec 64) V!6353 (_ BitVec 64) V!6353) Unit!6156)

(assert (=> b!203807 (= lt!102997 (addCommutativeForDiffKeys!152 lt!102996 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8612 () Bool)

(declare-fun tp!18551 () Bool)

(assert (=> mapNonEmpty!8612 (= mapRes!8612 (and tp!18551 e!133391))))

(declare-fun mapRest!8612 () (Array (_ BitVec 32) ValueCell!2171))

(declare-fun mapValue!8612 () ValueCell!2171)

(declare-fun mapKey!8612 () (_ BitVec 32))

(assert (=> mapNonEmpty!8612 (= (arr!4385 _values!649) (store mapRest!8612 mapKey!8612 mapValue!8612))))

(declare-fun b!203808 () Bool)

(declare-fun res!98012 () Bool)

(assert (=> b!203808 (=> (not res!98012) (not e!133393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203808 (= res!98012 (validKeyInArray!0 k0!843))))

(declare-fun b!203809 () Bool)

(declare-fun res!98010 () Bool)

(assert (=> b!203809 (=> (not res!98010) (not e!133393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9271 (_ BitVec 32)) Bool)

(assert (=> b!203809 (= res!98010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20518 res!98013) b!203800))

(assert (= (and b!203800 res!98009) b!203809))

(assert (= (and b!203809 res!98010) b!203801))

(assert (= (and b!203801 res!98015) b!203804))

(assert (= (and b!203804 res!98016) b!203808))

(assert (= (and b!203808 res!98012) b!203798))

(assert (= (and b!203798 res!98014) b!203806))

(assert (= (and b!203806 (not res!98011)) b!203802))

(assert (= (and b!203802 (not res!98017)) b!203807))

(assert (= (and b!203799 condMapEmpty!8612) mapIsEmpty!8612))

(assert (= (and b!203799 (not condMapEmpty!8612)) mapNonEmpty!8612))

(get-info :version)

(assert (= (and mapNonEmpty!8612 ((_ is ValueCellFull!2171) mapValue!8612)) b!203805))

(assert (= (and b!203799 ((_ is ValueCellFull!2171) mapDefault!8612)) b!203803))

(assert (= start!20518 b!203799))

(declare-fun m!231393 () Bool)

(assert (=> b!203809 m!231393))

(declare-fun m!231395 () Bool)

(assert (=> b!203801 m!231395))

(declare-fun m!231397 () Bool)

(assert (=> b!203808 m!231397))

(declare-fun m!231399 () Bool)

(assert (=> mapNonEmpty!8612 m!231399))

(declare-fun m!231401 () Bool)

(assert (=> start!20518 m!231401))

(declare-fun m!231403 () Bool)

(assert (=> start!20518 m!231403))

(declare-fun m!231405 () Bool)

(assert (=> start!20518 m!231405))

(declare-fun m!231407 () Bool)

(assert (=> b!203798 m!231407))

(declare-fun m!231409 () Bool)

(assert (=> b!203806 m!231409))

(declare-fun m!231411 () Bool)

(assert (=> b!203806 m!231411))

(declare-fun m!231413 () Bool)

(assert (=> b!203806 m!231413))

(declare-fun m!231415 () Bool)

(assert (=> b!203806 m!231415))

(declare-fun m!231417 () Bool)

(assert (=> b!203806 m!231417))

(declare-fun m!231419 () Bool)

(assert (=> b!203806 m!231419))

(declare-fun m!231421 () Bool)

(assert (=> b!203806 m!231421))

(declare-fun m!231423 () Bool)

(assert (=> b!203807 m!231423))

(declare-fun m!231425 () Bool)

(assert (=> b!203807 m!231425))

(declare-fun m!231427 () Bool)

(assert (=> b!203802 m!231427))

(declare-fun m!231429 () Bool)

(assert (=> b!203802 m!231429))

(declare-fun m!231431 () Bool)

(assert (=> b!203802 m!231431))

(check-sat (not b!203806) (not b!203801) b_and!11933 (not b_next!5173) (not start!20518) (not b!203802) tp_is_empty!5029 (not mapNonEmpty!8612) (not b!203808) (not b!203809) (not b!203807))
(check-sat b_and!11933 (not b_next!5173))
