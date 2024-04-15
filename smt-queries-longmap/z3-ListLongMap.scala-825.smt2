; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20050 () Bool)

(assert start!20050)

(declare-fun mapNonEmpty!7910 () Bool)

(declare-fun mapRes!7910 () Bool)

(declare-fun tp!17198 () Bool)

(declare-fun e!129166 () Bool)

(assert (=> mapNonEmpty!7910 (= mapRes!7910 (and tp!17198 e!129166))))

(declare-datatypes ((V!5729 0))(
  ( (V!5730 (val!2325 Int)) )
))
(declare-datatypes ((ValueCell!1937 0))(
  ( (ValueCellFull!1937 (v!4289 V!5729)) (EmptyCell!1937) )
))
(declare-datatypes ((array!8359 0))(
  ( (array!8360 (arr!3929 (Array (_ BitVec 32) ValueCell!1937)) (size!4255 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8359)

(declare-fun mapKey!7910 () (_ BitVec 32))

(declare-fun mapRest!7910 () (Array (_ BitVec 32) ValueCell!1937))

(declare-fun mapValue!7910 () ValueCell!1937)

(assert (=> mapNonEmpty!7910 (= (arr!3929 _values!649) (store mapRest!7910 mapKey!7910 mapValue!7910))))

(declare-fun b!196158 () Bool)

(declare-fun e!129165 () Bool)

(declare-fun e!129168 () Bool)

(assert (=> b!196158 (= e!129165 (and e!129168 mapRes!7910))))

(declare-fun condMapEmpty!7910 () Bool)

(declare-fun mapDefault!7910 () ValueCell!1937)

(assert (=> b!196158 (= condMapEmpty!7910 (= (arr!3929 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1937)) mapDefault!7910)))))

(declare-fun b!196159 () Bool)

(declare-fun res!92555 () Bool)

(declare-fun e!129167 () Bool)

(assert (=> b!196159 (=> (not res!92555) (not e!129167))))

(declare-datatypes ((array!8361 0))(
  ( (array!8362 (arr!3930 (Array (_ BitVec 32) (_ BitVec 64))) (size!4256 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8361)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8361 (_ BitVec 32)) Bool)

(assert (=> b!196159 (= res!92555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196161 () Bool)

(assert (=> b!196161 (= e!129167 false)))

(declare-fun lt!97415 () Bool)

(declare-datatypes ((List!2445 0))(
  ( (Nil!2442) (Cons!2441 (h!3083 (_ BitVec 64)) (t!7367 List!2445)) )
))
(declare-fun arrayNoDuplicates!0 (array!8361 (_ BitVec 32) List!2445) Bool)

(assert (=> b!196161 (= lt!97415 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2442))))

(declare-fun b!196162 () Bool)

(declare-fun res!92554 () Bool)

(assert (=> b!196162 (=> (not res!92554) (not e!129167))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196162 (= res!92554 (and (= (size!4255 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4256 _keys!825) (size!4255 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196163 () Bool)

(declare-fun tp_is_empty!4561 () Bool)

(assert (=> b!196163 (= e!129168 tp_is_empty!4561)))

(declare-fun mapIsEmpty!7910 () Bool)

(assert (=> mapIsEmpty!7910 mapRes!7910))

(declare-fun b!196160 () Bool)

(assert (=> b!196160 (= e!129166 tp_is_empty!4561)))

(declare-fun res!92553 () Bool)

(assert (=> start!20050 (=> (not res!92553) (not e!129167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20050 (= res!92553 (validMask!0 mask!1149))))

(assert (=> start!20050 e!129167))

(assert (=> start!20050 true))

(declare-fun array_inv!2547 (array!8359) Bool)

(assert (=> start!20050 (and (array_inv!2547 _values!649) e!129165)))

(declare-fun array_inv!2548 (array!8361) Bool)

(assert (=> start!20050 (array_inv!2548 _keys!825)))

(assert (= (and start!20050 res!92553) b!196162))

(assert (= (and b!196162 res!92554) b!196159))

(assert (= (and b!196159 res!92555) b!196161))

(assert (= (and b!196158 condMapEmpty!7910) mapIsEmpty!7910))

(assert (= (and b!196158 (not condMapEmpty!7910)) mapNonEmpty!7910))

(get-info :version)

(assert (= (and mapNonEmpty!7910 ((_ is ValueCellFull!1937) mapValue!7910)) b!196160))

(assert (= (and b!196158 ((_ is ValueCellFull!1937) mapDefault!7910)) b!196163))

(assert (= start!20050 b!196158))

(declare-fun m!223011 () Bool)

(assert (=> mapNonEmpty!7910 m!223011))

(declare-fun m!223013 () Bool)

(assert (=> b!196159 m!223013))

(declare-fun m!223015 () Bool)

(assert (=> b!196161 m!223015))

(declare-fun m!223017 () Bool)

(assert (=> start!20050 m!223017))

(declare-fun m!223019 () Bool)

(assert (=> start!20050 m!223019))

(declare-fun m!223021 () Bool)

(assert (=> start!20050 m!223021))

(check-sat (not b!196159) tp_is_empty!4561 (not start!20050) (not b!196161) (not mapNonEmpty!7910))
(check-sat)
