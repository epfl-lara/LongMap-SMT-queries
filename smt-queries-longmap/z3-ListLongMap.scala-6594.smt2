; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83450 () Bool)

(assert start!83450)

(declare-fun b_free!19437 () Bool)

(declare-fun b_next!19437 () Bool)

(assert (=> start!83450 (= b_free!19437 (not b_next!19437))))

(declare-fun tp!67599 () Bool)

(declare-fun b_and!31039 () Bool)

(assert (=> start!83450 (= tp!67599 b_and!31039)))

(declare-fun mapIsEmpty!35521 () Bool)

(declare-fun mapRes!35521 () Bool)

(assert (=> mapIsEmpty!35521 mapRes!35521))

(declare-fun b!974711 () Bool)

(declare-fun res!652471 () Bool)

(declare-fun e!549383 () Bool)

(assert (=> b!974711 (=> (not res!652471) (not e!549383))))

(declare-datatypes ((array!60721 0))(
  ( (array!60722 (arr!29224 (Array (_ BitVec 32) (_ BitVec 64))) (size!29703 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60721)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974711 (= res!652471 (validKeyInArray!0 (select (arr!29224 _keys!1717) i!822)))))

(declare-fun b!974712 () Bool)

(declare-fun e!549384 () Bool)

(declare-fun tp_is_empty!22341 () Bool)

(assert (=> b!974712 (= e!549384 tp_is_empty!22341)))

(declare-fun b!974714 () Bool)

(declare-fun e!549381 () Bool)

(assert (=> b!974714 (= e!549381 tp_is_empty!22341)))

(declare-fun b!974715 () Bool)

(assert (=> b!974715 (= e!549383 (bvslt i!822 #b00000000000000000000000000000000))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34771 0))(
  ( (V!34772 (val!11221 Int)) )
))
(declare-datatypes ((ValueCell!10689 0))(
  ( (ValueCellFull!10689 (v!13780 V!34771)) (EmptyCell!10689) )
))
(declare-datatypes ((array!60723 0))(
  ( (array!60724 (arr!29225 (Array (_ BitVec 32) ValueCell!10689)) (size!29704 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60723)

(declare-datatypes ((tuple2!14422 0))(
  ( (tuple2!14423 (_1!7222 (_ BitVec 64)) (_2!7222 V!34771)) )
))
(declare-datatypes ((List!20277 0))(
  ( (Nil!20274) (Cons!20273 (h!21435 tuple2!14422) (t!28754 List!20277)) )
))
(declare-datatypes ((ListLongMap!13119 0))(
  ( (ListLongMap!13120 (toList!6575 List!20277)) )
))
(declare-fun lt!432791 () ListLongMap!13119)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34771)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34771)

(declare-fun getCurrentListMap!3808 (array!60721 array!60723 (_ BitVec 32) (_ BitVec 32) V!34771 V!34771 (_ BitVec 32) Int) ListLongMap!13119)

(assert (=> b!974715 (= lt!432791 (getCurrentListMap!3808 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!974716 () Bool)

(declare-fun res!652473 () Bool)

(assert (=> b!974716 (=> (not res!652473) (not e!549383))))

(assert (=> b!974716 (= res!652473 (and (= (size!29704 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29703 _keys!1717) (size!29704 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974717 () Bool)

(declare-fun res!652474 () Bool)

(assert (=> b!974717 (=> (not res!652474) (not e!549383))))

(assert (=> b!974717 (= res!652474 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29703 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29703 _keys!1717))))))

(declare-fun mapNonEmpty!35521 () Bool)

(declare-fun tp!67598 () Bool)

(assert (=> mapNonEmpty!35521 (= mapRes!35521 (and tp!67598 e!549384))))

(declare-fun mapKey!35521 () (_ BitVec 32))

(declare-fun mapValue!35521 () ValueCell!10689)

(declare-fun mapRest!35521 () (Array (_ BitVec 32) ValueCell!10689))

(assert (=> mapNonEmpty!35521 (= (arr!29225 _values!1425) (store mapRest!35521 mapKey!35521 mapValue!35521))))

(declare-fun res!652475 () Bool)

(assert (=> start!83450 (=> (not res!652475) (not e!549383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83450 (= res!652475 (validMask!0 mask!2147))))

(assert (=> start!83450 e!549383))

(assert (=> start!83450 true))

(declare-fun e!549385 () Bool)

(declare-fun array_inv!22603 (array!60723) Bool)

(assert (=> start!83450 (and (array_inv!22603 _values!1425) e!549385)))

(assert (=> start!83450 tp_is_empty!22341))

(assert (=> start!83450 tp!67599))

(declare-fun array_inv!22604 (array!60721) Bool)

(assert (=> start!83450 (array_inv!22604 _keys!1717)))

(declare-fun b!974713 () Bool)

(assert (=> b!974713 (= e!549385 (and e!549381 mapRes!35521))))

(declare-fun condMapEmpty!35521 () Bool)

(declare-fun mapDefault!35521 () ValueCell!10689)

(assert (=> b!974713 (= condMapEmpty!35521 (= (arr!29225 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10689)) mapDefault!35521)))))

(declare-fun b!974718 () Bool)

(declare-fun res!652472 () Bool)

(assert (=> b!974718 (=> (not res!652472) (not e!549383))))

(declare-datatypes ((List!20278 0))(
  ( (Nil!20275) (Cons!20274 (h!21436 (_ BitVec 64)) (t!28755 List!20278)) )
))
(declare-fun arrayNoDuplicates!0 (array!60721 (_ BitVec 32) List!20278) Bool)

(assert (=> b!974718 (= res!652472 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20275))))

(declare-fun b!974719 () Bool)

(declare-fun res!652476 () Bool)

(assert (=> b!974719 (=> (not res!652476) (not e!549383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60721 (_ BitVec 32)) Bool)

(assert (=> b!974719 (= res!652476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83450 res!652475) b!974716))

(assert (= (and b!974716 res!652473) b!974719))

(assert (= (and b!974719 res!652476) b!974718))

(assert (= (and b!974718 res!652472) b!974717))

(assert (= (and b!974717 res!652474) b!974711))

(assert (= (and b!974711 res!652471) b!974715))

(assert (= (and b!974713 condMapEmpty!35521) mapIsEmpty!35521))

(assert (= (and b!974713 (not condMapEmpty!35521)) mapNonEmpty!35521))

(get-info :version)

(assert (= (and mapNonEmpty!35521 ((_ is ValueCellFull!10689) mapValue!35521)) b!974712))

(assert (= (and b!974713 ((_ is ValueCellFull!10689) mapDefault!35521)) b!974714))

(assert (= start!83450 b!974713))

(declare-fun m!902155 () Bool)

(assert (=> b!974711 m!902155))

(assert (=> b!974711 m!902155))

(declare-fun m!902157 () Bool)

(assert (=> b!974711 m!902157))

(declare-fun m!902159 () Bool)

(assert (=> start!83450 m!902159))

(declare-fun m!902161 () Bool)

(assert (=> start!83450 m!902161))

(declare-fun m!902163 () Bool)

(assert (=> start!83450 m!902163))

(declare-fun m!902165 () Bool)

(assert (=> mapNonEmpty!35521 m!902165))

(declare-fun m!902167 () Bool)

(assert (=> b!974715 m!902167))

(declare-fun m!902169 () Bool)

(assert (=> b!974719 m!902169))

(declare-fun m!902171 () Bool)

(assert (=> b!974718 m!902171))

(check-sat b_and!31039 (not start!83450) (not mapNonEmpty!35521) tp_is_empty!22341 (not b_next!19437) (not b!974711) (not b!974718) (not b!974715) (not b!974719))
(check-sat b_and!31039 (not b_next!19437))
