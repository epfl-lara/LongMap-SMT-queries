; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35742 () Bool)

(assert start!35742)

(declare-fun b!359139 () Bool)

(declare-fun res!199652 () Bool)

(declare-fun e!219912 () Bool)

(assert (=> b!359139 (=> (not res!199652) (not e!219912))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19954 0))(
  ( (array!19955 (arr!9470 (Array (_ BitVec 32) (_ BitVec 64))) (size!9822 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19954)

(declare-datatypes ((V!11923 0))(
  ( (V!11924 (val!4149 Int)) )
))
(declare-datatypes ((ValueCell!3761 0))(
  ( (ValueCellFull!3761 (v!6344 V!11923)) (EmptyCell!3761) )
))
(declare-datatypes ((array!19956 0))(
  ( (array!19957 (arr!9471 (Array (_ BitVec 32) ValueCell!3761)) (size!9823 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19956)

(assert (=> b!359139 (= res!199652 (and (= (size!9823 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9822 _keys!1456) (size!9823 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13821 () Bool)

(declare-fun mapRes!13821 () Bool)

(declare-fun tp!27888 () Bool)

(declare-fun e!219909 () Bool)

(assert (=> mapNonEmpty!13821 (= mapRes!13821 (and tp!27888 e!219909))))

(declare-fun mapRest!13821 () (Array (_ BitVec 32) ValueCell!3761))

(declare-fun mapKey!13821 () (_ BitVec 32))

(declare-fun mapValue!13821 () ValueCell!3761)

(assert (=> mapNonEmpty!13821 (= (arr!9471 _values!1208) (store mapRest!13821 mapKey!13821 mapValue!13821))))

(declare-fun b!359140 () Bool)

(declare-fun e!219911 () Bool)

(declare-fun tp_is_empty!8209 () Bool)

(assert (=> b!359140 (= e!219911 tp_is_empty!8209)))

(declare-fun b!359142 () Bool)

(assert (=> b!359142 (= e!219912 false)))

(declare-fun lt!166319 () Bool)

(declare-datatypes ((List!5366 0))(
  ( (Nil!5363) (Cons!5362 (h!6218 (_ BitVec 64)) (t!10508 List!5366)) )
))
(declare-fun arrayNoDuplicates!0 (array!19954 (_ BitVec 32) List!5366) Bool)

(assert (=> b!359142 (= lt!166319 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5363))))

(declare-fun b!359143 () Bool)

(assert (=> b!359143 (= e!219909 tp_is_empty!8209)))

(declare-fun b!359144 () Bool)

(declare-fun res!199654 () Bool)

(assert (=> b!359144 (=> (not res!199654) (not e!219912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19954 (_ BitVec 32)) Bool)

(assert (=> b!359144 (= res!199654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13821 () Bool)

(assert (=> mapIsEmpty!13821 mapRes!13821))

(declare-fun b!359141 () Bool)

(declare-fun e!219910 () Bool)

(assert (=> b!359141 (= e!219910 (and e!219911 mapRes!13821))))

(declare-fun condMapEmpty!13821 () Bool)

(declare-fun mapDefault!13821 () ValueCell!3761)

(assert (=> b!359141 (= condMapEmpty!13821 (= (arr!9471 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3761)) mapDefault!13821)))))

(declare-fun res!199653 () Bool)

(assert (=> start!35742 (=> (not res!199653) (not e!219912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35742 (= res!199653 (validMask!0 mask!1842))))

(assert (=> start!35742 e!219912))

(assert (=> start!35742 true))

(declare-fun array_inv!7000 (array!19956) Bool)

(assert (=> start!35742 (and (array_inv!7000 _values!1208) e!219910)))

(declare-fun array_inv!7001 (array!19954) Bool)

(assert (=> start!35742 (array_inv!7001 _keys!1456)))

(assert (= (and start!35742 res!199653) b!359139))

(assert (= (and b!359139 res!199652) b!359144))

(assert (= (and b!359144 res!199654) b!359142))

(assert (= (and b!359141 condMapEmpty!13821) mapIsEmpty!13821))

(assert (= (and b!359141 (not condMapEmpty!13821)) mapNonEmpty!13821))

(get-info :version)

(assert (= (and mapNonEmpty!13821 ((_ is ValueCellFull!3761) mapValue!13821)) b!359143))

(assert (= (and b!359141 ((_ is ValueCellFull!3761) mapDefault!13821)) b!359140))

(assert (= start!35742 b!359141))

(declare-fun m!357003 () Bool)

(assert (=> mapNonEmpty!13821 m!357003))

(declare-fun m!357005 () Bool)

(assert (=> b!359142 m!357005))

(declare-fun m!357007 () Bool)

(assert (=> b!359144 m!357007))

(declare-fun m!357009 () Bool)

(assert (=> start!35742 m!357009))

(declare-fun m!357011 () Bool)

(assert (=> start!35742 m!357011))

(declare-fun m!357013 () Bool)

(assert (=> start!35742 m!357013))

(check-sat (not mapNonEmpty!13821) tp_is_empty!8209 (not b!359142) (not b!359144) (not start!35742))
(check-sat)
