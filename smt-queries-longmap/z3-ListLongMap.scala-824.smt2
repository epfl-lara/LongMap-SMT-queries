; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20044 () Bool)

(assert start!20044)

(declare-fun b!196298 () Bool)

(declare-fun e!129245 () Bool)

(declare-fun tp_is_empty!4555 () Bool)

(assert (=> b!196298 (= e!129245 tp_is_empty!4555)))

(declare-fun b!196299 () Bool)

(declare-fun e!129247 () Bool)

(declare-fun mapRes!7901 () Bool)

(assert (=> b!196299 (= e!129247 (and e!129245 mapRes!7901))))

(declare-fun condMapEmpty!7901 () Bool)

(declare-datatypes ((V!5721 0))(
  ( (V!5722 (val!2322 Int)) )
))
(declare-datatypes ((ValueCell!1934 0))(
  ( (ValueCellFull!1934 (v!4293 V!5721)) (EmptyCell!1934) )
))
(declare-datatypes ((array!8361 0))(
  ( (array!8362 (arr!3931 (Array (_ BitVec 32) ValueCell!1934)) (size!4256 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8361)

(declare-fun mapDefault!7901 () ValueCell!1934)

(assert (=> b!196299 (= condMapEmpty!7901 (= (arr!3931 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1934)) mapDefault!7901)))))

(declare-fun mapIsEmpty!7901 () Bool)

(assert (=> mapIsEmpty!7901 mapRes!7901))

(declare-fun res!92643 () Bool)

(declare-fun e!129248 () Bool)

(assert (=> start!20044 (=> (not res!92643) (not e!129248))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20044 (= res!92643 (validMask!0 mask!1149))))

(assert (=> start!20044 e!129248))

(assert (=> start!20044 true))

(declare-fun array_inv!2549 (array!8361) Bool)

(assert (=> start!20044 (and (array_inv!2549 _values!649) e!129247)))

(declare-datatypes ((array!8363 0))(
  ( (array!8364 (arr!3932 (Array (_ BitVec 32) (_ BitVec 64))) (size!4257 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8363)

(declare-fun array_inv!2550 (array!8363) Bool)

(assert (=> start!20044 (array_inv!2550 _keys!825)))

(declare-fun b!196300 () Bool)

(declare-fun res!92642 () Bool)

(assert (=> b!196300 (=> (not res!92642) (not e!129248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8363 (_ BitVec 32)) Bool)

(assert (=> b!196300 (= res!92642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196301 () Bool)

(assert (=> b!196301 (= e!129248 false)))

(declare-fun lt!97646 () Bool)

(declare-datatypes ((List!2422 0))(
  ( (Nil!2419) (Cons!2418 (h!3060 (_ BitVec 64)) (t!7345 List!2422)) )
))
(declare-fun arrayNoDuplicates!0 (array!8363 (_ BitVec 32) List!2422) Bool)

(assert (=> b!196301 (= lt!97646 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2419))))

(declare-fun b!196302 () Bool)

(declare-fun res!92644 () Bool)

(assert (=> b!196302 (=> (not res!92644) (not e!129248))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196302 (= res!92644 (and (= (size!4256 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4257 _keys!825) (size!4256 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196303 () Bool)

(declare-fun e!129244 () Bool)

(assert (=> b!196303 (= e!129244 tp_is_empty!4555)))

(declare-fun mapNonEmpty!7901 () Bool)

(declare-fun tp!17189 () Bool)

(assert (=> mapNonEmpty!7901 (= mapRes!7901 (and tp!17189 e!129244))))

(declare-fun mapRest!7901 () (Array (_ BitVec 32) ValueCell!1934))

(declare-fun mapValue!7901 () ValueCell!1934)

(declare-fun mapKey!7901 () (_ BitVec 32))

(assert (=> mapNonEmpty!7901 (= (arr!3931 _values!649) (store mapRest!7901 mapKey!7901 mapValue!7901))))

(assert (= (and start!20044 res!92643) b!196302))

(assert (= (and b!196302 res!92644) b!196300))

(assert (= (and b!196300 res!92642) b!196301))

(assert (= (and b!196299 condMapEmpty!7901) mapIsEmpty!7901))

(assert (= (and b!196299 (not condMapEmpty!7901)) mapNonEmpty!7901))

(get-info :version)

(assert (= (and mapNonEmpty!7901 ((_ is ValueCellFull!1934) mapValue!7901)) b!196303))

(assert (= (and b!196299 ((_ is ValueCellFull!1934) mapDefault!7901)) b!196298))

(assert (= start!20044 b!196299))

(declare-fun m!223773 () Bool)

(assert (=> start!20044 m!223773))

(declare-fun m!223775 () Bool)

(assert (=> start!20044 m!223775))

(declare-fun m!223777 () Bool)

(assert (=> start!20044 m!223777))

(declare-fun m!223779 () Bool)

(assert (=> b!196300 m!223779))

(declare-fun m!223781 () Bool)

(assert (=> b!196301 m!223781))

(declare-fun m!223783 () Bool)

(assert (=> mapNonEmpty!7901 m!223783))

(check-sat (not b!196300) tp_is_empty!4555 (not mapNonEmpty!7901) (not start!20044) (not b!196301))
(check-sat)
