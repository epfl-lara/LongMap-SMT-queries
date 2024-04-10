; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20774 () Bool)

(assert start!20774)

(declare-fun res!101154 () Bool)

(declare-fun e!135763 () Bool)

(assert (=> start!20774 (=> (not res!101154) (not e!135763))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20774 (= res!101154 (validMask!0 mask!1149))))

(assert (=> start!20774 e!135763))

(assert (=> start!20774 true))

(declare-datatypes ((V!6699 0))(
  ( (V!6700 (val!2689 Int)) )
))
(declare-datatypes ((ValueCell!2301 0))(
  ( (ValueCellFull!2301 (v!4659 V!6699)) (EmptyCell!2301) )
))
(declare-datatypes ((array!9783 0))(
  ( (array!9784 (arr!4642 (Array (_ BitVec 32) ValueCell!2301)) (size!4967 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9783)

(declare-fun e!135764 () Bool)

(declare-fun array_inv!3077 (array!9783) Bool)

(assert (=> start!20774 (and (array_inv!3077 _values!649) e!135764)))

(declare-datatypes ((array!9785 0))(
  ( (array!9786 (arr!4643 (Array (_ BitVec 32) (_ BitVec 64))) (size!4968 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9785)

(declare-fun array_inv!3078 (array!9785) Bool)

(assert (=> start!20774 (array_inv!3078 _keys!825)))

(declare-fun mapNonEmpty!9002 () Bool)

(declare-fun mapRes!9002 () Bool)

(declare-fun tp!19325 () Bool)

(declare-fun e!135762 () Bool)

(assert (=> mapNonEmpty!9002 (= mapRes!9002 (and tp!19325 e!135762))))

(declare-fun mapKey!9002 () (_ BitVec 32))

(declare-fun mapValue!9002 () ValueCell!2301)

(declare-fun mapRest!9002 () (Array (_ BitVec 32) ValueCell!2301))

(assert (=> mapNonEmpty!9002 (= (arr!4642 _values!649) (store mapRest!9002 mapKey!9002 mapValue!9002))))

(declare-fun b!208086 () Bool)

(declare-fun res!101153 () Bool)

(assert (=> b!208086 (=> (not res!101153) (not e!135763))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208086 (= res!101153 (and (= (size!4967 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4968 _keys!825) (size!4967 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208087 () Bool)

(declare-fun e!135761 () Bool)

(declare-fun tp_is_empty!5289 () Bool)

(assert (=> b!208087 (= e!135761 tp_is_empty!5289)))

(declare-fun mapIsEmpty!9002 () Bool)

(assert (=> mapIsEmpty!9002 mapRes!9002))

(declare-fun b!208088 () Bool)

(assert (=> b!208088 (= e!135763 false)))

(declare-fun lt!106725 () Bool)

(declare-datatypes ((List!2971 0))(
  ( (Nil!2968) (Cons!2967 (h!3609 (_ BitVec 64)) (t!7902 List!2971)) )
))
(declare-fun arrayNoDuplicates!0 (array!9785 (_ BitVec 32) List!2971) Bool)

(assert (=> b!208088 (= lt!106725 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2968))))

(declare-fun b!208089 () Bool)

(assert (=> b!208089 (= e!135762 tp_is_empty!5289)))

(declare-fun b!208090 () Bool)

(assert (=> b!208090 (= e!135764 (and e!135761 mapRes!9002))))

(declare-fun condMapEmpty!9002 () Bool)

(declare-fun mapDefault!9002 () ValueCell!2301)

(assert (=> b!208090 (= condMapEmpty!9002 (= (arr!4642 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2301)) mapDefault!9002)))))

(declare-fun b!208091 () Bool)

(declare-fun res!101155 () Bool)

(assert (=> b!208091 (=> (not res!101155) (not e!135763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9785 (_ BitVec 32)) Bool)

(assert (=> b!208091 (= res!101155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20774 res!101154) b!208086))

(assert (= (and b!208086 res!101153) b!208091))

(assert (= (and b!208091 res!101155) b!208088))

(assert (= (and b!208090 condMapEmpty!9002) mapIsEmpty!9002))

(assert (= (and b!208090 (not condMapEmpty!9002)) mapNonEmpty!9002))

(get-info :version)

(assert (= (and mapNonEmpty!9002 ((_ is ValueCellFull!2301) mapValue!9002)) b!208089))

(assert (= (and b!208090 ((_ is ValueCellFull!2301) mapDefault!9002)) b!208087))

(assert (= start!20774 b!208090))

(declare-fun m!235831 () Bool)

(assert (=> start!20774 m!235831))

(declare-fun m!235833 () Bool)

(assert (=> start!20774 m!235833))

(declare-fun m!235835 () Bool)

(assert (=> start!20774 m!235835))

(declare-fun m!235837 () Bool)

(assert (=> mapNonEmpty!9002 m!235837))

(declare-fun m!235839 () Bool)

(assert (=> b!208088 m!235839))

(declare-fun m!235841 () Bool)

(assert (=> b!208091 m!235841))

(check-sat (not mapNonEmpty!9002) (not start!20774) (not b!208088) tp_is_empty!5289 (not b!208091))
(check-sat)
