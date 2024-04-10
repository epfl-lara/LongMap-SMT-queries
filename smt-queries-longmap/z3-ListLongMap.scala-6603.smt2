; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83504 () Bool)

(assert start!83504)

(declare-fun b_free!19491 () Bool)

(declare-fun b_next!19491 () Bool)

(assert (=> start!83504 (= b_free!19491 (not b_next!19491))))

(declare-fun tp!67761 () Bool)

(declare-fun b_and!31093 () Bool)

(assert (=> start!83504 (= tp!67761 b_and!31093)))

(declare-fun b!975517 () Bool)

(declare-fun res!653039 () Bool)

(declare-fun e!549788 () Bool)

(assert (=> b!975517 (=> (not res!653039) (not e!549788))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34843 0))(
  ( (V!34844 (val!11248 Int)) )
))
(declare-datatypes ((ValueCell!10716 0))(
  ( (ValueCellFull!10716 (v!13807 V!34843)) (EmptyCell!10716) )
))
(declare-datatypes ((array!60821 0))(
  ( (array!60822 (arr!29274 (Array (_ BitVec 32) ValueCell!10716)) (size!29753 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60821)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60823 0))(
  ( (array!60824 (arr!29275 (Array (_ BitVec 32) (_ BitVec 64))) (size!29754 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60823)

(assert (=> b!975517 (= res!653039 (and (= (size!29753 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29754 _keys!1717) (size!29753 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35602 () Bool)

(declare-fun mapRes!35602 () Bool)

(assert (=> mapIsEmpty!35602 mapRes!35602))

(declare-fun b!975518 () Bool)

(declare-fun e!549787 () Bool)

(declare-fun e!549790 () Bool)

(assert (=> b!975518 (= e!549787 (and e!549790 mapRes!35602))))

(declare-fun condMapEmpty!35602 () Bool)

(declare-fun mapDefault!35602 () ValueCell!10716)

(assert (=> b!975518 (= condMapEmpty!35602 (= (arr!29274 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10716)) mapDefault!35602)))))

(declare-fun b!975519 () Bool)

(declare-fun res!653035 () Bool)

(assert (=> b!975519 (=> (not res!653035) (not e!549788))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975519 (= res!653035 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29754 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29754 _keys!1717))))))

(declare-fun b!975520 () Bool)

(assert (=> b!975520 (= e!549788 false)))

(declare-fun zeroValue!1367 () V!34843)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34843)

(declare-datatypes ((tuple2!14466 0))(
  ( (tuple2!14467 (_1!7244 (_ BitVec 64)) (_2!7244 V!34843)) )
))
(declare-datatypes ((List!20318 0))(
  ( (Nil!20315) (Cons!20314 (h!21476 tuple2!14466) (t!28795 List!20318)) )
))
(declare-datatypes ((ListLongMap!13163 0))(
  ( (ListLongMap!13164 (toList!6597 List!20318)) )
))
(declare-fun lt!432872 () ListLongMap!13163)

(declare-fun getCurrentListMap!3830 (array!60823 array!60821 (_ BitVec 32) (_ BitVec 32) V!34843 V!34843 (_ BitVec 32) Int) ListLongMap!13163)

(assert (=> b!975520 (= lt!432872 (getCurrentListMap!3830 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35602 () Bool)

(declare-fun tp!67760 () Bool)

(declare-fun e!549786 () Bool)

(assert (=> mapNonEmpty!35602 (= mapRes!35602 (and tp!67760 e!549786))))

(declare-fun mapKey!35602 () (_ BitVec 32))

(declare-fun mapRest!35602 () (Array (_ BitVec 32) ValueCell!10716))

(declare-fun mapValue!35602 () ValueCell!10716)

(assert (=> mapNonEmpty!35602 (= (arr!29274 _values!1425) (store mapRest!35602 mapKey!35602 mapValue!35602))))

(declare-fun b!975521 () Bool)

(declare-fun res!653040 () Bool)

(assert (=> b!975521 (=> (not res!653040) (not e!549788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60823 (_ BitVec 32)) Bool)

(assert (=> b!975521 (= res!653040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975522 () Bool)

(declare-fun res!653038 () Bool)

(assert (=> b!975522 (=> (not res!653038) (not e!549788))))

(declare-datatypes ((List!20319 0))(
  ( (Nil!20316) (Cons!20315 (h!21477 (_ BitVec 64)) (t!28796 List!20319)) )
))
(declare-fun arrayNoDuplicates!0 (array!60823 (_ BitVec 32) List!20319) Bool)

(assert (=> b!975522 (= res!653038 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20316))))

(declare-fun b!975523 () Bool)

(declare-fun tp_is_empty!22395 () Bool)

(assert (=> b!975523 (= e!549790 tp_is_empty!22395)))

(declare-fun b!975524 () Bool)

(declare-fun res!653034 () Bool)

(assert (=> b!975524 (=> (not res!653034) (not e!549788))))

(declare-fun contains!5678 (ListLongMap!13163 (_ BitVec 64)) Bool)

(assert (=> b!975524 (= res!653034 (contains!5678 (getCurrentListMap!3830 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29275 _keys!1717) i!822)))))

(declare-fun res!653036 () Bool)

(assert (=> start!83504 (=> (not res!653036) (not e!549788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83504 (= res!653036 (validMask!0 mask!2147))))

(assert (=> start!83504 e!549788))

(assert (=> start!83504 true))

(declare-fun array_inv!22639 (array!60821) Bool)

(assert (=> start!83504 (and (array_inv!22639 _values!1425) e!549787)))

(assert (=> start!83504 tp_is_empty!22395))

(assert (=> start!83504 tp!67761))

(declare-fun array_inv!22640 (array!60823) Bool)

(assert (=> start!83504 (array_inv!22640 _keys!1717)))

(declare-fun b!975525 () Bool)

(assert (=> b!975525 (= e!549786 tp_is_empty!22395)))

(declare-fun b!975526 () Bool)

(declare-fun res!653037 () Bool)

(assert (=> b!975526 (=> (not res!653037) (not e!549788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975526 (= res!653037 (validKeyInArray!0 (select (arr!29275 _keys!1717) i!822)))))

(assert (= (and start!83504 res!653036) b!975517))

(assert (= (and b!975517 res!653039) b!975521))

(assert (= (and b!975521 res!653040) b!975522))

(assert (= (and b!975522 res!653038) b!975519))

(assert (= (and b!975519 res!653035) b!975526))

(assert (= (and b!975526 res!653037) b!975524))

(assert (= (and b!975524 res!653034) b!975520))

(assert (= (and b!975518 condMapEmpty!35602) mapIsEmpty!35602))

(assert (= (and b!975518 (not condMapEmpty!35602)) mapNonEmpty!35602))

(get-info :version)

(assert (= (and mapNonEmpty!35602 ((_ is ValueCellFull!10716) mapValue!35602)) b!975525))

(assert (= (and b!975518 ((_ is ValueCellFull!10716) mapDefault!35602)) b!975523))

(assert (= start!83504 b!975518))

(declare-fun m!902741 () Bool)

(assert (=> b!975522 m!902741))

(declare-fun m!902743 () Bool)

(assert (=> b!975524 m!902743))

(declare-fun m!902745 () Bool)

(assert (=> b!975524 m!902745))

(assert (=> b!975524 m!902743))

(assert (=> b!975524 m!902745))

(declare-fun m!902747 () Bool)

(assert (=> b!975524 m!902747))

(declare-fun m!902749 () Bool)

(assert (=> mapNonEmpty!35602 m!902749))

(assert (=> b!975526 m!902745))

(assert (=> b!975526 m!902745))

(declare-fun m!902751 () Bool)

(assert (=> b!975526 m!902751))

(declare-fun m!902753 () Bool)

(assert (=> start!83504 m!902753))

(declare-fun m!902755 () Bool)

(assert (=> start!83504 m!902755))

(declare-fun m!902757 () Bool)

(assert (=> start!83504 m!902757))

(declare-fun m!902759 () Bool)

(assert (=> b!975521 m!902759))

(declare-fun m!902761 () Bool)

(assert (=> b!975520 m!902761))

(check-sat tp_is_empty!22395 (not b!975520) (not b!975521) (not mapNonEmpty!35602) b_and!31093 (not b!975522) (not b!975526) (not start!83504) (not b!975524) (not b_next!19491))
(check-sat b_and!31093 (not b_next!19491))
