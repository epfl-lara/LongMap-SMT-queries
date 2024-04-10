; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36014 () Bool)

(assert start!36014)

(declare-fun b!361688 () Bool)

(declare-fun res!201203 () Bool)

(declare-fun e!221520 () Bool)

(assert (=> b!361688 (=> (not res!201203) (not e!221520))))

(declare-datatypes ((array!20347 0))(
  ( (array!20348 (arr!9660 (Array (_ BitVec 32) (_ BitVec 64))) (size!10012 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20347)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20347 (_ BitVec 32)) Bool)

(assert (=> b!361688 (= res!201203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361689 () Bool)

(declare-fun res!201201 () Bool)

(assert (=> b!361689 (=> (not res!201201) (not e!221520))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361689 (= res!201201 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361690 () Bool)

(declare-fun e!221521 () Bool)

(declare-fun tp_is_empty!8397 () Bool)

(assert (=> b!361690 (= e!221521 tp_is_empty!8397)))

(declare-fun b!361691 () Bool)

(declare-fun res!201202 () Bool)

(assert (=> b!361691 (=> (not res!201202) (not e!221520))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-datatypes ((V!12173 0))(
  ( (V!12174 (val!4243 Int)) )
))
(declare-datatypes ((ValueCell!3855 0))(
  ( (ValueCellFull!3855 (v!6438 V!12173)) (EmptyCell!3855) )
))
(declare-datatypes ((array!20349 0))(
  ( (array!20350 (arr!9661 (Array (_ BitVec 32) ValueCell!3855)) (size!10013 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20349)

(assert (=> b!361691 (= res!201202 (and (= (size!10013 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10012 _keys!1541) (size!10013 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361692 () Bool)

(declare-fun e!221522 () Bool)

(declare-fun e!221523 () Bool)

(declare-fun mapRes!14124 () Bool)

(assert (=> b!361692 (= e!221522 (and e!221523 mapRes!14124))))

(declare-fun condMapEmpty!14124 () Bool)

(declare-fun mapDefault!14124 () ValueCell!3855)

(assert (=> b!361692 (= condMapEmpty!14124 (= (arr!9661 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3855)) mapDefault!14124)))))

(declare-fun b!361693 () Bool)

(declare-fun res!201204 () Bool)

(assert (=> b!361693 (=> (not res!201204) (not e!221520))))

(declare-datatypes ((List!5512 0))(
  ( (Nil!5509) (Cons!5508 (h!6364 (_ BitVec 64)) (t!10662 List!5512)) )
))
(declare-fun arrayNoDuplicates!0 (array!20347 (_ BitVec 32) List!5512) Bool)

(assert (=> b!361693 (= res!201204 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5509))))

(declare-fun b!361694 () Bool)

(assert (=> b!361694 (= e!221520 (and (not (= (select (arr!9660 _keys!1541) from!1924) k0!1134)) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000)))))

(declare-fun res!201206 () Bool)

(assert (=> start!36014 (=> (not res!201206) (not e!221520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36014 (= res!201206 (validMask!0 mask!1943))))

(assert (=> start!36014 e!221520))

(assert (=> start!36014 true))

(declare-fun array_inv!7106 (array!20347) Bool)

(assert (=> start!36014 (array_inv!7106 _keys!1541)))

(declare-fun array_inv!7107 (array!20349) Bool)

(assert (=> start!36014 (and (array_inv!7107 _values!1277) e!221522)))

(declare-fun mapIsEmpty!14124 () Bool)

(assert (=> mapIsEmpty!14124 mapRes!14124))

(declare-fun b!361695 () Bool)

(declare-fun res!201205 () Bool)

(assert (=> b!361695 (=> (not res!201205) (not e!221520))))

(assert (=> b!361695 (= res!201205 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10012 _keys!1541))))))

(declare-fun mapNonEmpty!14124 () Bool)

(declare-fun tp!28200 () Bool)

(assert (=> mapNonEmpty!14124 (= mapRes!14124 (and tp!28200 e!221521))))

(declare-fun mapRest!14124 () (Array (_ BitVec 32) ValueCell!3855))

(declare-fun mapKey!14124 () (_ BitVec 32))

(declare-fun mapValue!14124 () ValueCell!3855)

(assert (=> mapNonEmpty!14124 (= (arr!9661 _values!1277) (store mapRest!14124 mapKey!14124 mapValue!14124))))

(declare-fun b!361696 () Bool)

(assert (=> b!361696 (= e!221523 tp_is_empty!8397)))

(assert (= (and start!36014 res!201206) b!361691))

(assert (= (and b!361691 res!201202) b!361688))

(assert (= (and b!361688 res!201203) b!361693))

(assert (= (and b!361693 res!201204) b!361695))

(assert (= (and b!361695 res!201205) b!361689))

(assert (= (and b!361689 res!201201) b!361694))

(assert (= (and b!361692 condMapEmpty!14124) mapIsEmpty!14124))

(assert (= (and b!361692 (not condMapEmpty!14124)) mapNonEmpty!14124))

(get-info :version)

(assert (= (and mapNonEmpty!14124 ((_ is ValueCellFull!3855) mapValue!14124)) b!361690))

(assert (= (and b!361692 ((_ is ValueCellFull!3855) mapDefault!14124)) b!361696))

(assert (= start!36014 b!361692))

(declare-fun m!358415 () Bool)

(assert (=> b!361694 m!358415))

(declare-fun m!358417 () Bool)

(assert (=> start!36014 m!358417))

(declare-fun m!358419 () Bool)

(assert (=> start!36014 m!358419))

(declare-fun m!358421 () Bool)

(assert (=> start!36014 m!358421))

(declare-fun m!358423 () Bool)

(assert (=> b!361689 m!358423))

(declare-fun m!358425 () Bool)

(assert (=> b!361693 m!358425))

(declare-fun m!358427 () Bool)

(assert (=> mapNonEmpty!14124 m!358427))

(declare-fun m!358429 () Bool)

(assert (=> b!361688 m!358429))

(check-sat tp_is_empty!8397 (not mapNonEmpty!14124) (not b!361689) (not b!361693) (not b!361688) (not start!36014))
(check-sat)
