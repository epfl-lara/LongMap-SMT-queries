; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35772 () Bool)

(assert start!35772)

(declare-fun b!359409 () Bool)

(declare-fun e!220137 () Bool)

(assert (=> b!359409 (= e!220137 false)))

(declare-fun lt!166364 () Bool)

(declare-datatypes ((array!20014 0))(
  ( (array!20015 (arr!9500 (Array (_ BitVec 32) (_ BitVec 64))) (size!9852 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20014)

(declare-datatypes ((List!5377 0))(
  ( (Nil!5374) (Cons!5373 (h!6229 (_ BitVec 64)) (t!10519 List!5377)) )
))
(declare-fun arrayNoDuplicates!0 (array!20014 (_ BitVec 32) List!5377) Bool)

(assert (=> b!359409 (= lt!166364 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5374))))

(declare-fun mapNonEmpty!13866 () Bool)

(declare-fun mapRes!13866 () Bool)

(declare-fun tp!27933 () Bool)

(declare-fun e!220135 () Bool)

(assert (=> mapNonEmpty!13866 (= mapRes!13866 (and tp!27933 e!220135))))

(declare-datatypes ((V!11963 0))(
  ( (V!11964 (val!4164 Int)) )
))
(declare-datatypes ((ValueCell!3776 0))(
  ( (ValueCellFull!3776 (v!6359 V!11963)) (EmptyCell!3776) )
))
(declare-fun mapRest!13866 () (Array (_ BitVec 32) ValueCell!3776))

(declare-fun mapValue!13866 () ValueCell!3776)

(declare-fun mapKey!13866 () (_ BitVec 32))

(declare-datatypes ((array!20016 0))(
  ( (array!20017 (arr!9501 (Array (_ BitVec 32) ValueCell!3776)) (size!9853 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20016)

(assert (=> mapNonEmpty!13866 (= (arr!9501 _values!1208) (store mapRest!13866 mapKey!13866 mapValue!13866))))

(declare-fun b!359410 () Bool)

(declare-fun res!199788 () Bool)

(assert (=> b!359410 (=> (not res!199788) (not e!220137))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20014 (_ BitVec 32)) Bool)

(assert (=> b!359410 (= res!199788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359411 () Bool)

(declare-fun e!220134 () Bool)

(declare-fun e!220138 () Bool)

(assert (=> b!359411 (= e!220134 (and e!220138 mapRes!13866))))

(declare-fun condMapEmpty!13866 () Bool)

(declare-fun mapDefault!13866 () ValueCell!3776)

(assert (=> b!359411 (= condMapEmpty!13866 (= (arr!9501 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3776)) mapDefault!13866)))))

(declare-fun res!199789 () Bool)

(assert (=> start!35772 (=> (not res!199789) (not e!220137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35772 (= res!199789 (validMask!0 mask!1842))))

(assert (=> start!35772 e!220137))

(assert (=> start!35772 true))

(declare-fun array_inv!7022 (array!20016) Bool)

(assert (=> start!35772 (and (array_inv!7022 _values!1208) e!220134)))

(declare-fun array_inv!7023 (array!20014) Bool)

(assert (=> start!35772 (array_inv!7023 _keys!1456)))

(declare-fun b!359412 () Bool)

(declare-fun tp_is_empty!8239 () Bool)

(assert (=> b!359412 (= e!220138 tp_is_empty!8239)))

(declare-fun b!359413 () Bool)

(assert (=> b!359413 (= e!220135 tp_is_empty!8239)))

(declare-fun b!359414 () Bool)

(declare-fun res!199787 () Bool)

(assert (=> b!359414 (=> (not res!199787) (not e!220137))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359414 (= res!199787 (and (= (size!9853 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9852 _keys!1456) (size!9853 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13866 () Bool)

(assert (=> mapIsEmpty!13866 mapRes!13866))

(assert (= (and start!35772 res!199789) b!359414))

(assert (= (and b!359414 res!199787) b!359410))

(assert (= (and b!359410 res!199788) b!359409))

(assert (= (and b!359411 condMapEmpty!13866) mapIsEmpty!13866))

(assert (= (and b!359411 (not condMapEmpty!13866)) mapNonEmpty!13866))

(get-info :version)

(assert (= (and mapNonEmpty!13866 ((_ is ValueCellFull!3776) mapValue!13866)) b!359413))

(assert (= (and b!359411 ((_ is ValueCellFull!3776) mapDefault!13866)) b!359412))

(assert (= start!35772 b!359411))

(declare-fun m!357183 () Bool)

(assert (=> b!359409 m!357183))

(declare-fun m!357185 () Bool)

(assert (=> mapNonEmpty!13866 m!357185))

(declare-fun m!357187 () Bool)

(assert (=> b!359410 m!357187))

(declare-fun m!357189 () Bool)

(assert (=> start!35772 m!357189))

(declare-fun m!357191 () Bool)

(assert (=> start!35772 m!357191))

(declare-fun m!357193 () Bool)

(assert (=> start!35772 m!357193))

(check-sat (not b!359409) (not mapNonEmpty!13866) (not start!35772) tp_is_empty!8239 (not b!359410))
(check-sat)
