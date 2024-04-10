; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20030 () Bool)

(assert start!20030)

(declare-fun mapIsEmpty!7886 () Bool)

(declare-fun mapRes!7886 () Bool)

(assert (=> mapIsEmpty!7886 mapRes!7886))

(declare-fun b!196161 () Bool)

(declare-fun res!92578 () Bool)

(declare-fun e!129147 () Bool)

(assert (=> b!196161 (=> (not res!92578) (not e!129147))))

(declare-datatypes ((array!8353 0))(
  ( (array!8354 (arr!3927 (Array (_ BitVec 32) (_ BitVec 64))) (size!4252 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8353)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5707 0))(
  ( (V!5708 (val!2317 Int)) )
))
(declare-datatypes ((ValueCell!1929 0))(
  ( (ValueCellFull!1929 (v!4287 V!5707)) (EmptyCell!1929) )
))
(declare-datatypes ((array!8355 0))(
  ( (array!8356 (arr!3928 (Array (_ BitVec 32) ValueCell!1929)) (size!4253 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8355)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196161 (= res!92578 (and (= (size!4253 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4252 _keys!825) (size!4253 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7886 () Bool)

(declare-fun tp!17174 () Bool)

(declare-fun e!129146 () Bool)

(assert (=> mapNonEmpty!7886 (= mapRes!7886 (and tp!17174 e!129146))))

(declare-fun mapValue!7886 () ValueCell!1929)

(declare-fun mapRest!7886 () (Array (_ BitVec 32) ValueCell!1929))

(declare-fun mapKey!7886 () (_ BitVec 32))

(assert (=> mapNonEmpty!7886 (= (arr!3928 _values!649) (store mapRest!7886 mapKey!7886 mapValue!7886))))

(declare-fun b!196162 () Bool)

(declare-fun tp_is_empty!4545 () Bool)

(assert (=> b!196162 (= e!129146 tp_is_empty!4545)))

(declare-fun b!196163 () Bool)

(declare-fun e!129145 () Bool)

(assert (=> b!196163 (= e!129145 tp_is_empty!4545)))

(declare-fun res!92577 () Bool)

(assert (=> start!20030 (=> (not res!92577) (not e!129147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20030 (= res!92577 (validMask!0 mask!1149))))

(assert (=> start!20030 e!129147))

(assert (=> start!20030 true))

(declare-fun e!129149 () Bool)

(declare-fun array_inv!2553 (array!8355) Bool)

(assert (=> start!20030 (and (array_inv!2553 _values!649) e!129149)))

(declare-fun array_inv!2554 (array!8353) Bool)

(assert (=> start!20030 (array_inv!2554 _keys!825)))

(declare-fun b!196164 () Bool)

(declare-fun res!92576 () Bool)

(assert (=> b!196164 (=> (not res!92576) (not e!129147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8353 (_ BitVec 32)) Bool)

(assert (=> b!196164 (= res!92576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196165 () Bool)

(assert (=> b!196165 (= e!129149 (and e!129145 mapRes!7886))))

(declare-fun condMapEmpty!7886 () Bool)

(declare-fun mapDefault!7886 () ValueCell!1929)

(assert (=> b!196165 (= condMapEmpty!7886 (= (arr!3928 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1929)) mapDefault!7886)))))

(declare-fun b!196166 () Bool)

(assert (=> b!196166 (= e!129147 false)))

(declare-fun lt!97572 () Bool)

(declare-datatypes ((List!2461 0))(
  ( (Nil!2458) (Cons!2457 (h!3099 (_ BitVec 64)) (t!7392 List!2461)) )
))
(declare-fun arrayNoDuplicates!0 (array!8353 (_ BitVec 32) List!2461) Bool)

(assert (=> b!196166 (= lt!97572 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2458))))

(assert (= (and start!20030 res!92577) b!196161))

(assert (= (and b!196161 res!92578) b!196164))

(assert (= (and b!196164 res!92576) b!196166))

(assert (= (and b!196165 condMapEmpty!7886) mapIsEmpty!7886))

(assert (= (and b!196165 (not condMapEmpty!7886)) mapNonEmpty!7886))

(get-info :version)

(assert (= (and mapNonEmpty!7886 ((_ is ValueCellFull!1929) mapValue!7886)) b!196162))

(assert (= (and b!196165 ((_ is ValueCellFull!1929) mapDefault!7886)) b!196163))

(assert (= start!20030 b!196165))

(declare-fun m!223531 () Bool)

(assert (=> mapNonEmpty!7886 m!223531))

(declare-fun m!223533 () Bool)

(assert (=> start!20030 m!223533))

(declare-fun m!223535 () Bool)

(assert (=> start!20030 m!223535))

(declare-fun m!223537 () Bool)

(assert (=> start!20030 m!223537))

(declare-fun m!223539 () Bool)

(assert (=> b!196164 m!223539))

(declare-fun m!223541 () Bool)

(assert (=> b!196166 m!223541))

(check-sat tp_is_empty!4545 (not b!196164) (not b!196166) (not mapNonEmpty!7886) (not start!20030))
(check-sat)
