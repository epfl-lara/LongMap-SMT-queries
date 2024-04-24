; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83256 () Bool)

(assert start!83256)

(declare-fun b!970139 () Bool)

(declare-fun res!649084 () Bool)

(declare-fun e!546990 () Bool)

(assert (=> b!970139 (=> (not res!649084) (not e!546990))))

(declare-datatypes ((array!60038 0))(
  ( (array!60039 (arr!28878 (Array (_ BitVec 32) (_ BitVec 64))) (size!29358 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60038)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60038 (_ BitVec 32)) Bool)

(assert (=> b!970139 (= res!649084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34978 () Bool)

(declare-fun mapRes!34978 () Bool)

(assert (=> mapIsEmpty!34978 mapRes!34978))

(declare-fun b!970140 () Bool)

(declare-fun e!546988 () Bool)

(declare-fun e!546991 () Bool)

(assert (=> b!970140 (= e!546988 (and e!546991 mapRes!34978))))

(declare-fun condMapEmpty!34978 () Bool)

(declare-datatypes ((V!34289 0))(
  ( (V!34290 (val!11040 Int)) )
))
(declare-datatypes ((ValueCell!10508 0))(
  ( (ValueCellFull!10508 (v!13596 V!34289)) (EmptyCell!10508) )
))
(declare-datatypes ((array!60040 0))(
  ( (array!60041 (arr!28879 (Array (_ BitVec 32) ValueCell!10508)) (size!29359 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60040)

(declare-fun mapDefault!34978 () ValueCell!10508)

(assert (=> b!970140 (= condMapEmpty!34978 (= (arr!28879 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10508)) mapDefault!34978)))))

(declare-fun b!970141 () Bool)

(declare-fun res!649083 () Bool)

(assert (=> b!970141 (=> (not res!649083) (not e!546990))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970141 (= res!649083 (and (= (size!29359 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29358 _keys!1717) (size!29359 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970142 () Bool)

(assert (=> b!970142 (= e!546990 false)))

(declare-fun lt!431979 () Bool)

(declare-datatypes ((List!20011 0))(
  ( (Nil!20008) (Cons!20007 (h!21175 (_ BitVec 64)) (t!28366 List!20011)) )
))
(declare-fun arrayNoDuplicates!0 (array!60038 (_ BitVec 32) List!20011) Bool)

(assert (=> b!970142 (= lt!431979 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20008))))

(declare-fun b!970143 () Bool)

(declare-fun tp_is_empty!21979 () Bool)

(assert (=> b!970143 (= e!546991 tp_is_empty!21979)))

(declare-fun b!970144 () Bool)

(declare-fun e!546987 () Bool)

(assert (=> b!970144 (= e!546987 tp_is_empty!21979)))

(declare-fun res!649085 () Bool)

(assert (=> start!83256 (=> (not res!649085) (not e!546990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83256 (= res!649085 (validMask!0 mask!2147))))

(assert (=> start!83256 e!546990))

(assert (=> start!83256 true))

(declare-fun array_inv!22409 (array!60040) Bool)

(assert (=> start!83256 (and (array_inv!22409 _values!1425) e!546988)))

(declare-fun array_inv!22410 (array!60038) Bool)

(assert (=> start!83256 (array_inv!22410 _keys!1717)))

(declare-fun mapNonEmpty!34978 () Bool)

(declare-fun tp!66547 () Bool)

(assert (=> mapNonEmpty!34978 (= mapRes!34978 (and tp!66547 e!546987))))

(declare-fun mapRest!34978 () (Array (_ BitVec 32) ValueCell!10508))

(declare-fun mapKey!34978 () (_ BitVec 32))

(declare-fun mapValue!34978 () ValueCell!10508)

(assert (=> mapNonEmpty!34978 (= (arr!28879 _values!1425) (store mapRest!34978 mapKey!34978 mapValue!34978))))

(assert (= (and start!83256 res!649085) b!970141))

(assert (= (and b!970141 res!649083) b!970139))

(assert (= (and b!970139 res!649084) b!970142))

(assert (= (and b!970140 condMapEmpty!34978) mapIsEmpty!34978))

(assert (= (and b!970140 (not condMapEmpty!34978)) mapNonEmpty!34978))

(get-info :version)

(assert (= (and mapNonEmpty!34978 ((_ is ValueCellFull!10508) mapValue!34978)) b!970144))

(assert (= (and b!970140 ((_ is ValueCellFull!10508) mapDefault!34978)) b!970143))

(assert (= start!83256 b!970140))

(declare-fun m!898601 () Bool)

(assert (=> b!970139 m!898601))

(declare-fun m!898603 () Bool)

(assert (=> b!970142 m!898603))

(declare-fun m!898605 () Bool)

(assert (=> start!83256 m!898605))

(declare-fun m!898607 () Bool)

(assert (=> start!83256 m!898607))

(declare-fun m!898609 () Bool)

(assert (=> start!83256 m!898609))

(declare-fun m!898611 () Bool)

(assert (=> mapNonEmpty!34978 m!898611))

(check-sat tp_is_empty!21979 (not b!970142) (not b!970139) (not start!83256) (not mapNonEmpty!34978))
(check-sat)
