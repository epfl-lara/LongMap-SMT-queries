; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39012 () Bool)

(assert start!39012)

(declare-fun b!408926 () Bool)

(declare-fun res!236696 () Bool)

(declare-fun e!245385 () Bool)

(assert (=> b!408926 (=> (not res!236696) (not e!245385))))

(declare-datatypes ((array!24735 0))(
  ( (array!24736 (arr!11817 (Array (_ BitVec 32) (_ BitVec 64))) (size!12169 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24735)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408926 (= res!236696 (or (= (select (arr!11817 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11817 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408927 () Bool)

(declare-fun e!245388 () Bool)

(declare-fun tp_is_empty!10431 () Bool)

(assert (=> b!408927 (= e!245388 tp_is_empty!10431)))

(declare-fun mapIsEmpty!17268 () Bool)

(declare-fun mapRes!17268 () Bool)

(assert (=> mapIsEmpty!17268 mapRes!17268))

(declare-fun b!408928 () Bool)

(declare-fun res!236689 () Bool)

(assert (=> b!408928 (=> (not res!236689) (not e!245385))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408928 (= res!236689 (validKeyInArray!0 k0!794))))

(declare-fun b!408929 () Bool)

(declare-fun res!236688 () Bool)

(assert (=> b!408929 (=> (not res!236688) (not e!245385))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408929 (= res!236688 (validMask!0 mask!1025))))

(declare-fun b!408930 () Bool)

(declare-fun res!236694 () Bool)

(assert (=> b!408930 (=> (not res!236694) (not e!245385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24735 (_ BitVec 32)) Bool)

(assert (=> b!408930 (= res!236694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408931 () Bool)

(declare-fun res!236692 () Bool)

(assert (=> b!408931 (=> (not res!236692) (not e!245385))))

(assert (=> b!408931 (= res!236692 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12169 _keys!709))))))

(declare-fun b!408932 () Bool)

(declare-fun e!245387 () Bool)

(assert (=> b!408932 (= e!245387 false)))

(declare-fun lt!188872 () Bool)

(declare-fun lt!188873 () array!24735)

(declare-datatypes ((List!6843 0))(
  ( (Nil!6840) (Cons!6839 (h!7695 (_ BitVec 64)) (t!12017 List!6843)) )
))
(declare-fun arrayNoDuplicates!0 (array!24735 (_ BitVec 32) List!6843) Bool)

(assert (=> b!408932 (= lt!188872 (arrayNoDuplicates!0 lt!188873 #b00000000000000000000000000000000 Nil!6840))))

(declare-fun b!408933 () Bool)

(declare-fun res!236695 () Bool)

(assert (=> b!408933 (=> (not res!236695) (not e!245385))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15013 0))(
  ( (V!15014 (val!5260 Int)) )
))
(declare-datatypes ((ValueCell!4872 0))(
  ( (ValueCellFull!4872 (v!7507 V!15013)) (EmptyCell!4872) )
))
(declare-datatypes ((array!24737 0))(
  ( (array!24738 (arr!11818 (Array (_ BitVec 32) ValueCell!4872)) (size!12170 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24737)

(assert (=> b!408933 (= res!236695 (and (= (size!12170 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12169 _keys!709) (size!12170 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408934 () Bool)

(declare-fun e!245386 () Bool)

(assert (=> b!408934 (= e!245386 (and e!245388 mapRes!17268))))

(declare-fun condMapEmpty!17268 () Bool)

(declare-fun mapDefault!17268 () ValueCell!4872)

(assert (=> b!408934 (= condMapEmpty!17268 (= (arr!11818 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4872)) mapDefault!17268)))))

(declare-fun mapNonEmpty!17268 () Bool)

(declare-fun tp!33387 () Bool)

(declare-fun e!245383 () Bool)

(assert (=> mapNonEmpty!17268 (= mapRes!17268 (and tp!33387 e!245383))))

(declare-fun mapKey!17268 () (_ BitVec 32))

(declare-fun mapValue!17268 () ValueCell!4872)

(declare-fun mapRest!17268 () (Array (_ BitVec 32) ValueCell!4872))

(assert (=> mapNonEmpty!17268 (= (arr!11818 _values!549) (store mapRest!17268 mapKey!17268 mapValue!17268))))

(declare-fun res!236697 () Bool)

(assert (=> start!39012 (=> (not res!236697) (not e!245385))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39012 (= res!236697 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12169 _keys!709))))))

(assert (=> start!39012 e!245385))

(assert (=> start!39012 true))

(declare-fun array_inv!8622 (array!24737) Bool)

(assert (=> start!39012 (and (array_inv!8622 _values!549) e!245386)))

(declare-fun array_inv!8623 (array!24735) Bool)

(assert (=> start!39012 (array_inv!8623 _keys!709)))

(declare-fun b!408935 () Bool)

(declare-fun res!236693 () Bool)

(assert (=> b!408935 (=> (not res!236693) (not e!245385))))

(declare-fun arrayContainsKey!0 (array!24735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408935 (= res!236693 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408936 () Bool)

(declare-fun res!236690 () Bool)

(assert (=> b!408936 (=> (not res!236690) (not e!245385))))

(assert (=> b!408936 (= res!236690 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6840))))

(declare-fun b!408937 () Bool)

(assert (=> b!408937 (= e!245383 tp_is_empty!10431)))

(declare-fun b!408938 () Bool)

(assert (=> b!408938 (= e!245385 e!245387)))

(declare-fun res!236691 () Bool)

(assert (=> b!408938 (=> (not res!236691) (not e!245387))))

(assert (=> b!408938 (= res!236691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188873 mask!1025))))

(assert (=> b!408938 (= lt!188873 (array!24736 (store (arr!11817 _keys!709) i!563 k0!794) (size!12169 _keys!709)))))

(assert (= (and start!39012 res!236697) b!408929))

(assert (= (and b!408929 res!236688) b!408933))

(assert (= (and b!408933 res!236695) b!408930))

(assert (= (and b!408930 res!236694) b!408936))

(assert (= (and b!408936 res!236690) b!408931))

(assert (= (and b!408931 res!236692) b!408928))

(assert (= (and b!408928 res!236689) b!408926))

(assert (= (and b!408926 res!236696) b!408935))

(assert (= (and b!408935 res!236693) b!408938))

(assert (= (and b!408938 res!236691) b!408932))

(assert (= (and b!408934 condMapEmpty!17268) mapIsEmpty!17268))

(assert (= (and b!408934 (not condMapEmpty!17268)) mapNonEmpty!17268))

(get-info :version)

(assert (= (and mapNonEmpty!17268 ((_ is ValueCellFull!4872) mapValue!17268)) b!408937))

(assert (= (and b!408934 ((_ is ValueCellFull!4872) mapDefault!17268)) b!408927))

(assert (= start!39012 b!408934))

(declare-fun m!400039 () Bool)

(assert (=> mapNonEmpty!17268 m!400039))

(declare-fun m!400041 () Bool)

(assert (=> start!39012 m!400041))

(declare-fun m!400043 () Bool)

(assert (=> start!39012 m!400043))

(declare-fun m!400045 () Bool)

(assert (=> b!408936 m!400045))

(declare-fun m!400047 () Bool)

(assert (=> b!408932 m!400047))

(declare-fun m!400049 () Bool)

(assert (=> b!408929 m!400049))

(declare-fun m!400051 () Bool)

(assert (=> b!408930 m!400051))

(declare-fun m!400053 () Bool)

(assert (=> b!408926 m!400053))

(declare-fun m!400055 () Bool)

(assert (=> b!408938 m!400055))

(declare-fun m!400057 () Bool)

(assert (=> b!408938 m!400057))

(declare-fun m!400059 () Bool)

(assert (=> b!408928 m!400059))

(declare-fun m!400061 () Bool)

(assert (=> b!408935 m!400061))

(check-sat (not mapNonEmpty!17268) (not start!39012) (not b!408932) (not b!408936) (not b!408935) (not b!408938) tp_is_empty!10431 (not b!408928) (not b!408930) (not b!408929))
(check-sat)
